function isNpmPackageInstalled(packageName)
    return vim.cmd('npm list --depth 1 --global ' + packageName)
end