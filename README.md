# README
## 目标：菜鸡博客

## 项目介绍
参考[Hexo](https://hexo.io/zh-cn/index.html)写一个自己的博客项目，相比之前做的小项目，这个模型层面会更全面些，一对一，一对多，多对多，前后端使用JSON联调。

使用[meilisearch](https://www.meilisearch.com/)来做文档搜索，参考Rei的教程:[bilibili](https://www.bilibili.com/video/BV1cv4y1W7Hn/?spm_id_from=333.880.my_history.page.click)

## 样式参考
1. 页面布局: https://50projects50days.com/projects/sticky-navbar/
2. 文字滚动: https://50projects50days.com/projects/auto-text-effect/
3. 搜索栏目: https://50projects50days.com/projects/todo-list/

虽然使用BEM方法论来组织CSS文件，但写样式还是很痛苦，后面打算试试Tailwind，参考这篇文章：https://adamwathan.me/css-utility-classes-and-separation-of-concerns/

> 启动服务
1. bundle install
2. yarn
3. ./bin/setup
4. rails db:seed
5. rails s  或  ./bin/dev