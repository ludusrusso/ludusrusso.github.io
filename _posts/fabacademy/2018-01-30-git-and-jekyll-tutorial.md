---
layout: post
date: 2018-01-30
tags:
  - jekyll
  - fabacademy
  - git
  - Web Development
title: Git and Jekyll for fun for Fab Academy 2018
subtitle: assignment 1
author: ludusrusso
image: /assets/images/fabac.jpg
category: fabacademy
headerImage: false
---

Hey,
this is the first report I'm writing for **Fab Academy 2018**. The assignment
for the class is the following:

  - work through a git tutorial
  - build a personal site in the class archive describing you and your final project

Actually, I'm quite expert in using git (and of course several platform like github and gitlab),
and I'm very confortable in developing web sites.
So I'll write a tutorial to share my knowledge here.

I'd like to write a tutorial on a super powerful tool called [Jekyll](https://jekyllrb.com/), that is
a **static site** generator super interesting to implement blogs and website in
a very easy way and for free. The most interesting thing aboout jekyll is it integration
with online platform for code management like **GitHub** and **GitLab**. In fact, these
tools enables the user to push online a Jekyll based project that will be *automagically* converted in a real website hosted direclty (and for free) by the two services.

In the last year, I've developed some blogs with this technology. Hence, he goal of
this tutorial is how to use **Jekyll** and a theme that I developed for [my personal blog](https://ludusrusso.cc/) to build a personal page for the **Fab Academy 2018**.

**GitHub** and **GitLab** are super powerful tools to share code and work with other
developers on complex project. However, they are more :D


### Static Web Sites with GitHub/GitLab pages
**GitHub**/**GitLab** pages are nice tools developed by the two services to set
up in zero time a static web site, i.e., a web page that is delivered exactly as
they are stored in the repository, without any server side preprocessing after a request.

Static Sites are very useful when you are developing a very simple web site (like a blog or a documentation page)
that does not requires dynamic content. In this case you can manually generate each **html** page in your site and serve it throw a simple web server.

Using **GitHub**/**GitLab** pages, you can simply store a static web site under a special repo on your account, and it will be automatically served without any complex configuration of the server.

#### Setting up a simple static page with GitLab

Let's us build a simple static site using **GitLab** pages, with only the main page and using git to interact with **GitLab**.

First of all, we need to create a special repository on our GitLab account.
The repo should be named in this way: `<your gitlab username>.gitlab.io`. In my
case, the repo name is `ludusrusso.gitlab.io`, since my account on gitlab is `ludusrusso`.

> Note that the name of the repo is mandatory, for instance, I **cannot** create
a repo `enricobassi.gitlab.io`, since my username is not `enricobassi`.

![Create page](/assets/imgs/2018-01-30-git-and-jekyll-tutorial.md/pagecreation.png)

Once created, let's clone the (empty) repo in our local computer in order we can
working on it.

```
$ git clone git@gitlab.com:ludusrusso/ludusrusso.gitlab.io.git
```

Now, we can open the directory with any text editor we like. In my case, I prefer the
[Atom text editor](https://atom.io/).

```
$ cd ludusrusso.gitlab.io.git
$ atom .
```

Accoring to [GitLab docs](https://docs.gitlab.com/ee/user/project/pages/index.html), we
need to setup a file called `.gitlab-ci.yml` (pleae note that the file starts with `.`) with the following content:

```yaml
image: alpine:latest

pages:
  stage: deploy
  script:
  - echo 'Nothing to do...'
  artifacts:
    paths:
    - public
  only:
  - master
```

Essentially, this file tels GitLab that the repo should be considered as a simple
static file repo and that the site path is `/public`.

Now we can create the `/public` folder and create the `/public/index.html` file
inside it. Let's create a very simple file, with the following content.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title> Fab Academy 2018 | Ludus Russo </title>
  </head>
  <body>
    <h1>This is a test</h1>
    <p>This is a one page static internet site developed by <a href="https://ludusrusso.cc/">Ludus Russo</a></p>
  </body>
</html>
```

Ok, that enought to create our webpage!
Now we need to commit and deploy the files:

```bash
$ git add .gitlab-ci.yml public/index.html
$ git commit -m "first commit"
$ git push origin master
```

That's all! Now just wait few mintues and visit the url given by your repo name,
and you'll see your first static site online!!

![Simple static site online](/assets/imgs/2018-01-30-git-and-jekyll-tutorial.md/simplestaticsite.png)

You can find all the [repo at this link](https://gitlab.com/ludusrusso/ludusrusso.gitlab.io-simple/tree/master).
## Using Jekyll to generate the static site

Ok, as you can see writing a simple static file is super easy. However, writing
directly HTML code is error prone and boring, so I do not suggest to develop your entire
site in this way.

Luckily, other people before us had this problem, and they find an elegant solution called
**Static Site Generator**. In simple worlds, a static site generator is a program
that takes a site project written in a form that is simple to manage by humans and
transform it in working static site.

The most used static site generator is [Jekyll](https://jekyllrb.com/), and, of course, GitLab Pages supports it.

In **Jekyll**, you can separate the theme of your blog from the content inside it. The theme, and in general the layout, can be implemented in an extended version of html (called [Liquid](https://shopify.github.io/liquid/)), that is a simple template language that enable you to "program" your html code. For instance, you can define a `site.title` variable and then use it in the following way:

```html
<title> {% raw %}{{ site.title }}{% endraw %} </title>
```

and it will replace with the content of `site.title`, like

```html
<title> {{ site.title }} </title>
```


On the other side, contents in Jekyll are generated starting from a **Markdown** file. **Markdow** is a super simple markup language, and it can be condered a super simplified version of `html`. When you write markdown, you need only to remember few
special **rules**, and you don't need to write `xml` code.

Jekyll will then merge all togher, and generate the static site we can view online.

The nice stuff? GitLab builds a Jekyll repo automatically when we push it online,
so it is a super simple way to develop sites using Jekyll.

Let's start developing out Jekyll site. First of all, we need to download a base
repo to use as a starting point, since the Jekyll configuration from scratch is
not easy. Fortunatly, gitlab provides a [raw Jekyll repo](https://gitlab.com/pages/jekyll) ready to be cloned.

However, in this guide, we will use a template I develop for my personal blog, that you can
find at [this repo](https://gitlab.com/ludusrusso/ludusrusso.gitlab.io).

However, befor staring, we need to crate a new repo with the same name but the
content of out starting point repo.

#### Replacing the Repo

To do so, the simplest way I found is to delete the old repo and create a new one
forking my [Ludus Jekyll Template](https://gitlab.com/ludusrusso/ludusrusso.gitlab.io).

To do this, first of all, we need to delete the previous repository. You can
delete from *Settings* > *advance Settings* > *Remove project*

![Deleting Repo](/assets/imgs/2018-01-30-git-and-jekyll-tutorial.md/deleting1.png)
![Deleting Repo](/assets/imgs/2018-01-30-git-and-jekyll-tutorial.md/deleting2.png)

Rember to delete it also from our local PC

```bash
$ rm -rf ludusrusso.gitlab.io
```
Once deleted, fork the [Ludus Jekyll Template](https://gitlab.com/ludusrusso/ludusrusso.gitlab.io)
and rename the repository with the original name.

![Renaming Repo](/assets/imgs/2018-01-30-git-and-jekyll-tutorial.md/fork.png)

To do so, change the setting both under *Settings* > *General project settings* > *Project name*
and *Settings* > *Advanced settings* > *Rename repository*.

![Renaming Repo](/assets/imgs/2018-01-30-git-and-jekyll-tutorial.md/renaming1.png)
![Renaming Repo](/assets/imgs/2018-01-30-git-and-jekyll-tutorial.md/renaming2.png)


#### Working on the site

Ok, finally we can clone it and start working on it :D

```bash
$ git clone git@gitlab.com:<gitlab username>/<gitlab username>.gitlub.io.git
$ cd <gitlab username>.gitlub.io.git
$ atom .
```

The first file to edit is the `_config.yml` file. Here you can add
your information to configure the internet site

Edit the `title`, `bio` and `description` configuration to start customizing your blog,
you can then try to do some changes to see what happens to the blog then.

To upload the project, commit the changes and push it online.

```bash
$ git commit -am "up config"
$ git push origin master
```

After some minutes, the new page should appear on our personal url.


#### Writing a Post


We are finally ready to start writing a post. To do so, all you need to do is create
a file in the `_posts` directory. How you name files in this folder is important. Jekyll requires blog post files to be named according to the following format:

```
<YEAR>-<MONTH>-<DAY>-<title>.md
```

I will create a file colled `_post/30-01-2018-welcome-fabacademy-2018`

The file is divided in two part.
The first one are the **Metadata** informations, that sets the post title, author,
tags, etc. The metadata have to be written in the following format at the beginning of
the file

```Markdown
---
title: post title
date: 30-01-2018
author: ludusrusso
tags:
  - fabacademy
---
```

The second part is the actual post written in **Markdown**. For a good introduction
to Markdown, you can read [this page](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

Here is an example of Markdown file

```Markdown

# I'm an `h1` header
## I'm an `h2` header

I'm a paragraph

I'm an other paragraph with a [hyperlink to ludusrusso.cc](https://ludusrusso.cc)

![I'm an image](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png)
```

That will be rendered in the following HTML

```html
<h2>I'm an <code>h2</code> header</h2>
<p>I'm a paragraph</p>
<p>I'm an other paragraph with a <a href="https://ludusrusso.cc">hyperlink to ludusrusso.cc</a></p>
<p><img alt="I'm an image" src="https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png"></p>
```

And it will look like this

<div class="md-output">
<div id="output" class="content markdown-body"><h1>I'm an <code>h1</code> header</h1>

<h2>I'm an <code>h2</code> header</h2>

<p>I'm a paragraph</p>

<p>I'm an other paragraph with a <a href="https://ludusrusso.cc">hyperlink to ludusrusso.cc</a></p>

<p><img alt="I'm an image" src="https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png"></p></div>
</div>

So, let's write a simple post with it

```markdown
---
title: Fab Academy First Posts
layout: post
date: 2018-01-30
tag:
 - Fab Academy
category: blog
author: ludusrusso
---

Hey,

this is my first post on the **Ludus Russo Jekyll Template** developed for the
[Fab Academy 2018](http://fabacademy.org/).

This is my better image:

![Fab Academy Image](/assets/images/fabac.jpg)
```

### Get Online

Nice!
Now we need only to commit and push the repo:

```bash
$ git commit -am "add post"
$ git push origin master
```

We need to wait about 5 minutes (GitLab is free but it is also slow), for have
our site online! You can find [my page here](http://ludusrusso.gitlab.io/).

![Renaming Repo](/assets/imgs/2018-01-30-git-and-jekyll-tutorial.md/output.png)
