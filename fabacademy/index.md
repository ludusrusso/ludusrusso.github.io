---
layout: post
title: Fab Academy 2018
author: ludusrusso
image: /assets/images/fabac.jpg
headerImage: true
---

## Hi, welcome to my personal page of Fab Academy 2018.


As you probably don't know, I'm currently thinking on enrolling to the Fab Academy 2018.

> Due to some *technical issues*, I'm not actually enrolled, so I'm building this
sub-site on my personal blog to do the various exercizes.
> Once I'll be officially enrolled, I'll move this site into the official Fab Academy Page!

<section class="list">
	<div class="container-fluid">

		<div class="row">
			{% for post in site.categories.fabacademy %}
				{% include blog-post.html %}
			{% endfor %}
    </div>
  </div>
</section>
