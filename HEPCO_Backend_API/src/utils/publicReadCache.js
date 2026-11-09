const MAX_ENTRIES = 48;
const TTL_MS = 20_000;

const createPublicReadCache = () => {
  const entries = new Map();

  return {
    read(key, load) {
      const existing = entries.get(key);
      if (existing && existing.expiresAt > Date.now()) return existing.result;

      entries.delete(key);
      if (entries.size >= MAX_ENTRIES) entries.delete(entries.keys().next().value);

      const entry = { expiresAt: Infinity };
      entry.result = Promise.resolve().then(load).then(
        (value) => {
          entry.expiresAt = Date.now() + TTL_MS;
          return value;
        },
        (error) => {
          if (entries.get(key) === entry) entries.delete(key);
          throw error;
        }
      );
      entries.set(key, entry);
      return entry.result;
    },
    clear() {
      entries.clear();
    }
  };
};

module.exports = createPublicReadCache;
