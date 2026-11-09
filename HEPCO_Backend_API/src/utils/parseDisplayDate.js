// Parses Vietnamese display dates ("30/03/2026 9:27", "14/06/2026", "2025", "2026-03-30 09:27")
// into a Date, treating the wall-clock time as Vietnam time (UTC+7).
// Returns null when the value cannot be interpreted.
const VN_OFFSET_HOURS = 7;

const parseDisplayDate = (value, { yearOnly = 'end' } = {}) => {
  if (value === undefined || value === null) return null;
  const text = String(value).trim();
  if (!text) return null;

  const yearMatch = text.match(/^(\d{4})$/);
  if (yearMatch) {
    const year = Number(yearMatch[1]);
    return yearOnly === 'start' ? new Date(Date.UTC(year, 0, 1)) : new Date(Date.UTC(year, 11, 31));
  }

  const time = text.match(/(\d{1,2}):(\d{2})(?::(\d{2}))?/);
  const hour = time ? Number(time[1]) : 0;
  const minute = time ? Number(time[2]) : 0;
  const second = time && time[3] ? Number(time[3]) : 0;

  let year, month, day;
  const dmy = text.match(/(\d{1,2})[/.-](\d{1,2})[/.-](\d{4})/);
  const ymd = text.match(/(\d{4})[/.-](\d{1,2})[/.-](\d{1,2})/);
  if (dmy) { day = Number(dmy[1]); month = Number(dmy[2]); year = Number(dmy[3]); }
  else if (ymd) { year = Number(ymd[1]); month = Number(ymd[2]); day = Number(ymd[3]); }
  else return null;

  // "11/22/2021": the middle part cannot be a month, so the source was month/day/year.
  if (dmy && month > 12 && day <= 12) [day, month] = [month, day];
  if (month < 1 || month > 12 || day < 1 || day > 31 || hour > 23 || minute > 59) return null;
  const result = new Date(Date.UTC(year, month - 1, day, hour - VN_OFFSET_HOURS, minute, second));
  return Number.isNaN(result.getTime()) ? null : result;
};

module.exports = { parseDisplayDate };
