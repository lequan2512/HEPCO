import { useState } from 'react';
import {
  Users,
  UserPlus,
  Shield,
  Trash2,
  Edit2,
  X,
  Search,
  Lock,
  UserCheck
} from 'lucide-react';
import toast from 'react-hot-toast';
import { useGetUsers, useCreateUser, useUpdateUser, useDeleteUser } from '../../../apis/user';
import ConfirmModal from '../../../components/ConfirmModal';
import Loading from '../../../components/Loading';

const ROLE_LABELS = {
  super_admin: { label: 'Quản trị Tối cao', bg: 'bg-purple-100 text-purple-800 border-purple-200' },
  admin: { label: 'Quản trị viên', bg: 'bg-emerald-100 text-emerald-800 border-emerald-200' },
  editor: { label: 'Biên tập viên', bg: 'bg-blue-100 text-blue-800 border-blue-200' }
};

const AdminUserManager = () => {
  const [searchTerm, setSearchTerm] = useState('');
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [editingUser, setEditingUser] = useState(null);

  // Form states
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [role, setRole] = useState('admin');

  // Delete modal state
  const [deleteId, setDeleteId] = useState(null);

  const { data: usersResponse, isLoading } = useGetUsers();
  const users = usersResponse?.data || [];

  const createMutation = useCreateUser();
  const updateMutation = useUpdateUser();
  const deleteMutation = useDeleteUser();

  const handleOpenCreate = () => {
    setEditingUser(null);
    setUsername('');
    setPassword('');
    setRole('admin');
    setIsModalOpen(true);
  };

  const handleOpenEdit = (user) => {
    setEditingUser(user);
    setUsername(user.username);
    setPassword('');
    setRole(user.role || 'admin');
    setIsModalOpen(true);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!username.trim()) {
      toast.error('Vui lòng nhập tên đăng nhập');
      return;
    }

    if (!editingUser && (!password || password.length < 6)) {
      toast.error('Mật khẩu phải có tối thiểu 6 ký tự');
      return;
    }

    try {
      if (editingUser) {
        const payload = { id: editingUser.id, role };
        if (username !== editingUser.username) payload.username = username;
        if (password) payload.password = password;

        await updateMutation.mutateAsync(payload);
        toast.success(`Đã cập nhật tài khoản "${username}" thành công!`);
      } else {
        await createMutation.mutateAsync({ username: username.trim(), password, role });
        toast.success(`Đã tạo tài khoản quản trị "${username}" thành công!`);
      }
      setIsModalOpen(false);
    } catch (err) {
      toast.error(err.response?.data?.message || 'Có lỗi xảy ra khi lưu tài khoản');
    }
  };

  const handleDelete = async () => {
    if (!deleteId) return;
    try {
      await deleteMutation.mutateAsync(deleteId);
      toast.success('Đã xóa tài khoản quản trị thành công!');
    } catch (err) {
      toast.error(err.response?.data?.message || 'Không thể xóa tài khoản này');
    } finally {
      setDeleteId(null);
    }
  };

  const filteredUsers = users.filter((u) =>
    u.username.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div className="space-y-6">
      {/* Header Card */}
      <div className="bg-white p-5 sm:p-6 rounded-2xl shadow-xs border border-gray-200/80 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-extrabold text-gray-900 flex items-center gap-2.5">
            <Users className="w-6 h-6 text-[#0e8a44]" />
            <span>Quản Lý &amp; Phân Quyền Tài Khoản Admin</span>
          </h1>
          <p className="text-xs sm:text-sm text-gray-500 mt-1">
            Cấp tài khoản mới, phân quyền biên tập viên/quản trị viên và đổi mật khẩu truy cập hệ thống CMS.
          </p>
        </div>

        <button
          type="button"
          onClick={handleOpenCreate}
          className="inline-flex items-center gap-2 px-4 py-2.5 rounded-xl bg-[#0e8a44] hover:bg-emerald-700 text-white font-bold text-xs sm:text-sm shadow-md transition-all cursor-pointer shrink-0"
        >
          <UserPlus className="w-4 h-4" />
          <span>Cấp tài khoản Admin</span>
        </button>
      </div>

      {/* Filter / Search Bar */}
      <div className="bg-white p-4 rounded-2xl shadow-xs border border-gray-200/80 flex items-center gap-3">
        <Search className="w-4 h-4 text-gray-400 shrink-0 ml-1" />
        <input
          type="text"
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          placeholder="Tìm kiếm tài khoản theo tên..."
          className="w-full text-xs sm:text-sm text-gray-700 bg-transparent focus:outline-hidden"
        />
        {searchTerm && (
          <button
            onClick={() => setSearchTerm('')}
            className="p-1 rounded-md hover:bg-gray-100 text-gray-400 hover:text-gray-600"
          >
            <X className="w-4 h-4" />
          </button>
        )}
      </div>

      {/* Users Table */}
      <div className="bg-white rounded-2xl shadow-xs border border-gray-200/80 overflow-hidden">
        {isLoading ? (
          <div className="p-8 text-center">
            <Loading message="Đang tải danh sách tài khoản..." />
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse text-xs sm:text-sm">
              <thead>
                <tr className="bg-gray-50 border-b border-gray-200 text-gray-600 uppercase text-[11px] font-bold tracking-wider">
                  <th className="py-3.5 px-4 sm:px-6">ID</th>
                  <th className="py-3.5 px-4 sm:px-6">Tài khoản</th>
                  <th className="py-3.5 px-4 sm:px-6">Phân quyền</th>
                  <th className="py-3.5 px-4 sm:px-6">Ngày cấp</th>
                  <th className="py-3.5 px-4 sm:px-6 text-right">Thao tác</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {filteredUsers.length === 0 ? (
                  <tr>
                    <td colSpan={5} className="py-8 text-center text-gray-500">
                      Không tìm thấy tài khoản quản trị nào.
                    </td>
                  </tr>
                ) : (
                  filteredUsers.map((user) => {
                    const roleInfo = ROLE_LABELS[user.role] || ROLE_LABELS.admin;
                    const isRoot = user.id === 1 || user.username === 'admin';

                    return (
                      <tr key={user.id} className="hover:bg-gray-50/80 transition-colors">
                        <td className="py-3.5 px-4 sm:px-6 font-mono text-gray-400">
                          #{user.id}
                        </td>
                        <td className="py-3.5 px-4 sm:px-6">
                          <div className="flex items-center gap-2.5">
                            <div className="w-8 h-8 rounded-full bg-emerald-100 text-[#0e8a44] flex items-center justify-center font-bold text-xs">
                              {user.username.slice(0, 2).toUpperCase()}
                            </div>
                            <div>
                              <span className="font-bold text-gray-900 block">
                                {user.username}
                              </span>
                              {isRoot && (
                                <span className="text-[10px] text-purple-600 font-semibold flex items-center gap-0.5">
                                  <Shield className="w-3 h-3 fill-purple-600 text-purple-600" />
                                  Tài khoản gốc hệ thống
                                </span>
                              )}
                            </div>
                          </div>
                        </td>
                        <td className="py-3.5 px-4 sm:px-6">
                          <span
                            className={`inline-flex items-center gap-1 px-2.5 py-1 rounded-lg text-xs font-bold border ${roleInfo.bg}`}
                          >
                            <Shield className="w-3 h-3" />
                            {roleInfo.label}
                          </span>
                        </td>
                        <td className="py-3.5 px-4 sm:px-6 text-gray-500">
                          {user.created_at
                            ? new Date(user.created_at).toLocaleDateString('vi-VN')
                            : 'Mặc định'}
                        </td>
                        <td className="py-3.5 px-4 sm:px-6 text-right">
                          <div className="inline-flex items-center gap-1.5">
                            <button
                              type="button"
                              onClick={() => handleOpenEdit(user)}
                              className="p-1.5 rounded-lg text-blue-600 hover:bg-blue-50 transition-colors cursor-pointer"
                              title="Chỉnh sửa phân quyền & Mật khẩu"
                            >
                              <Edit2 className="w-4 h-4" />
                            </button>
                            {!isRoot && (
                              <button
                                type="button"
                                onClick={() => setDeleteId(user.id)}
                                className="p-1.5 rounded-lg text-rose-600 hover:bg-rose-50 transition-colors cursor-pointer"
                                title="Xóa tài khoản"
                              >
                                <Trash2 className="w-4 h-4" />
                              </button>
                            )}
                          </div>
                        </td>
                      </tr>
                    );
                  })
                )}
              </tbody>
            </table>
          </div>
        )}
      </div>

      {/* Modal Add / Edit User */}
      {isModalOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/60 backdrop-blur-xs">
          <div className="bg-white rounded-2xl max-w-md w-full p-6 shadow-2xl border border-gray-100 relative animate-in fade-in zoom-in-95 duration-200">
            <button
              onClick={() => setIsModalOpen(false)}
              className="absolute top-4 right-4 text-gray-400 hover:text-gray-700 p-1 rounded-lg"
            >
              <X className="w-5 h-5" />
            </button>

            <h3 className="text-lg font-black text-gray-900 mb-1 flex items-center gap-2">
              <UserCheck className="w-5 h-5 text-[#0e8a44]" />
              <span>{editingUser ? 'Cập Nhật Tài Khoản' : 'Cấp Tài Khoản Mới'}</span>
            </h3>
            <p className="text-xs text-gray-500 mb-5">
              {editingUser
                ? `Chỉnh sửa phân quyền hoặc đổi mật khẩu cho "${editingUser.username}".`
                : 'Tạo tài khoản quản trị mới có quyền đăng bài và chỉnh sửa nội dung website.'}
            </p>

            <form onSubmit={handleSubmit} className="space-y-4">
              <div>
                <label className="block text-xs font-bold text-gray-700 uppercase mb-1">
                  Tên đăng nhập
                </label>
                <input
                  type="text"
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                  disabled={Boolean(editingUser && editingUser.id === 1)}
                  placeholder="ví dụ: editor01"
                  className="w-full px-3.5 py-2.5 border border-gray-300 rounded-xl text-sm focus:outline-hidden focus:ring-2 focus:ring-[#0e8a44] disabled:bg-gray-100"
                  required
                />
              </div>

              <div>
                <label className="block text-xs font-bold text-gray-700 uppercase mb-1">
                  {editingUser ? 'Mật khẩu mới (Để trống nếu không đổi)' : 'Mật khẩu truy cập'}
                </label>
                <div className="relative">
                  <input
                    type="password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    placeholder={editingUser ? '••••••••' : 'Tối thiểu 6 ký tự'}
                    className="w-full px-3.5 py-2.5 border border-gray-300 rounded-xl text-sm focus:outline-hidden focus:ring-2 focus:ring-[#0e8a44]"
                    required={!editingUser}
                  />
                  <Lock className="w-4 h-4 text-gray-400 absolute right-3.5 top-3" />
                </div>
              </div>

              <div>
                <label className="block text-xs font-bold text-gray-700 uppercase mb-1">
                  Phân quyền vai trò
                </label>
                <select
                  value={role}
                  onChange={(e) => setRole(e.target.value)}
                  className="w-full px-3.5 py-2.5 border border-gray-300 rounded-xl text-sm focus:outline-hidden focus:ring-2 focus:ring-[#0e8a44] bg-white font-medium"
                >
                  <option value="super_admin">Quản trị Tối cao (Toàn quyền hệ thống &amp; tài khoản)</option>
                  <option value="admin">Quản trị viên (Chỉnh sửa thông tin, tin tức, thông báo, cổ đông, dịch vụ)</option>
                  <option value="editor">Biên tập viên (Đăng và chỉnh sửa bài viết, tin tức)</option>
                </select>
              </div>

              <div className="pt-3 flex items-center justify-end gap-2.5 border-t border-gray-100">
                <button
                  type="button"
                  onClick={() => setIsModalOpen(false)}
                  className="px-4 py-2 rounded-xl border border-gray-300 text-gray-700 text-xs font-bold hover:bg-gray-50 transition-colors"
                >
                  Hủy bỏ
                </button>
                <button
                  type="submit"
                  disabled={createMutation.isPending || updateMutation.isPending}
                  className="px-5 py-2 rounded-xl bg-[#0e8a44] hover:bg-emerald-700 text-white text-xs font-bold shadow-md transition-colors disabled:opacity-50"
                >
                  {editingUser ? 'Lưu cập nhật' : 'Tạo tài khoản'}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Delete Confirmation Modal */}
      <ConfirmModal
        isOpen={Boolean(deleteId)}
        title="Xóa tài khoản quản trị"
        message="Bạn có chắc chắn muốn xóa tài khoản này khỏi hệ thống quản trị CMS? Thao tác này không thể hoàn tác."
        onConfirm={handleDelete}
        onClose={() => setDeleteId(null)}
      />
    </div>
  );
};

export default AdminUserManager;
