// 查询远端仓库的 tag，供 Jenkins 参数选择使用
def call(String url) {
    // def tags = parse(runGit(url))
    return ['a','b','c']//tags ?: ['latest']
}

// 在 controller 上执行 git，返回命令输出
private String runGit(String url) {
    def process = ['git', 'ls-remote', '--tags', '--refs', url].execute()
    process.waitForOrKill(30000)
    return process.text
}

// 从 ls-remote 输出里取出 tag 名
List<String> parse(String output) {
    return output.readLines()
            .findAll { it.contains('refs/tags/') }
            .collect { it.split('refs/tags/')[1].trim() }
}
