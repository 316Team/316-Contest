### Commit Message 规范

#### 为什么要规范Git Commit Message

在项目开发中我们会经常看到

- 说不出所以然的一连串的`commit`提交日志
- `commit`信息写的非常简单，根本没办法从`commit`信息中获取此次提交的用意
- `commit`信息写的很随意，`commit`信息和变更代码之间不能建立联系的，甚至有的是毫无关联的
- `commit`信息过于冗余的

这样的`commit`信息不利于项目的可持续化发展。一旦负责项目的开发人员离开，该项目则面临无人可维护，可继续开发的状态。同样，`changelog`也会无法进行，导致没有更新日志，无法`Code Review`，也会导致没有规范版本等一系列的问题。

那么理想中的`Git Commit Message`应该是要能够较好的解决如上问题

- `commit`和代码之间能建立起联系，并和相关的`issue`关联，做到任何代码都能区域性的解决问题（当然这也需要好的分支模型来支撑）
- 能够提供更多的历史信息，方便快速浏览。
- 可以过滤某些`commit`（如文档改动），便于快速查找信息。
- 可以直接从`commit`生成` Change Log`

#### 如何才能算是比较好的`Git Commit Message`？

1. 完整扼要的表述清楚此次提交的内容（如修改xxBUG，新增xx功能）
2. 和代码、`issue`关联，利于日后`Code Review`

#### `Commit Message`的格式

```shell
<type>(<scope>):<subject>
# 空一行
<body>
# 空一行
<footer>
```

不管是哪个部分，任何一行都不得超过72个字符。这是为了避免自动换行影响美观。

1. type

   `type`是用于说明`commit`的类别，常用为以下7个。

   - feat: 新功能（feature）
   - fix: 修补BUG
   - docs: 文档（documentation）
   - style: 格式（不影响代码运行的变动）
   - refactor: 重构（既不是新增功能，也不是修改BUG的代码变动）
   - test: 增加测试
   - chore: 构建过程或辅助工具的变动

   如果`type`为`feat`和`fix`，则该`commit`将肯定出现在`Change Log`之中。其他情况（`docs`、`chore`、`style`、`refacotr`、`test`）则不一定要加入`Change Log`中，建议是不要。

2. scope(可选)

   `scope`是用于说明`commit`影响的范围，比如数据层、控制层、视图层等等，视项目不同而不同。

3. subject

   `subject`是`commit`目的的简短描述，不超过50个字符。

   - 以动词开头，使用第一人称现在时，比如修改，而不是已修改等，`change`而不是`changed`或`changes`。
   - 第一个字母小写（中文则不需要）
   - 结尾不加句号

4. body

   `body`部分是对本次`commit`的详细描述，可分成多行。如：

   ```shell
   如有必要，可详细说明，但是每行不得超过72个字符
   
   中间空行一定要预留
   
   1. 使用第一人称现在时，比如修改，而不是已修改等，change而不是changed或changes
   2. 应该说明代码变动的动机，以及与以前行为的对比
   ```

5. footer

   如果当前`commit`针对某个`issue`，那么可以在`footer`部分关闭这个`issue`

   ```shell
   close #234
   Closes #234
   close #123, #234
   fix #234
   fix #234, #123
   ```

6. revert

   还有一种特殊情况，如果当前`commit`用于撤销以前的`commit`，则必须以`revert:`开头，后面跟着被撤销`Commit`的`Header`。

   ```shell
   revert: feat(pencil): add 'graphiteWidth' option
   
   This reverts commit 667ecc1654a317a13331b17617d973392f415f02.
   ```

   `Body`部分的格式是固定的，必须写成`This reverts commit hash`，其中的`hash`是被撤销`commit`的`SHA`标识符。

   如果当前`commit`与被撤销的`commit`，在同一个发布（release）里面，那么它们都不会出现在`Change Log`里面。如果两者在不同的发布，那么当前`commit`，会出现在`Change Log`的`Revert`小标题下面。

[git_commit](https://github.com/Asura-one/tools/blob/master/git_commit/git_commit)：自己写的一个`commit message`格式化的小工具，相比较其他工具来说，安装方便，主要使用`bash`来写的，属于全平台通用的工具。比较小巧，整个脚本也不过几`KB`。