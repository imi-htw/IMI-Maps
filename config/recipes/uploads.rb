after "deploy:update_code", "uploaded_data:symlink"

namespace :uploaded_data do
  desc "Create symlink"
    task :symlink do
      run "rm -rf #{release_path}/public/uploads"
      run "mkdir -p #{shared_path}/uploads"
      run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
    end
end
