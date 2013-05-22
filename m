From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: More man pages now rendered at man7.org
Date: Wed, 22 May 2013 15:22:24 +0200
Message-ID: <519CC690.9040005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello all,

As detailed in this blog post [1], I've expanded the set of man pages
rendered in HTML at http://man7.org/linux/man-pages/ to include pages
in addition to those provided by the man-pages project. This change
has several purposes. One main purpose is to provide a up-to-date and
regularly updated) HTML renderings of these man pages. (Most online
man page renderings are out-of-date to some extent--in some cases,
extremely out of date.) The other main purpose is to provide
information on where to report bugs in each man page. To this end, 
each HTML rendering includes a COLOPHON that describes the origin of
the page, notes the date when it was extracted, and provides
information on where to report bugs in the page. (The man-pages
project has already done this since December 2007, with the result
that many more man page bugs are nowadays reported.)

Currently, man pages from nearly 40 projects are rendered, raising
the number of pages rendered at man7.org from around 950 to around
1750. The projects that I have so far included have a bias that
matches my interests: man-pages, projects related to low-level C
and system programming (e.g., the ACL and extended attribute
libraries), toolchain projects (e.g., gcc, gdb, Git, coreutils,
binutils, util-linux), and other relevant tools (kmod, strace,
ltrace, procps, expect) and tools relevant to manual pages 
(e.g., groff, man-db). The full list of projects and the
corresponding man pages that are rendered can be found in 
the "man pages by project index" [2]. I'm open to adding further
projects to the rendered set, if they seem relevant. If you think
there is a project that should be added, take a look at this blog
post [3].

Cheers,

Michael


[1] http://blog.man7.org/2013/05/more-man-pages-now-rendered-on-man7org.html
[2] http://man7.org/linux/man-pages/dir_by_project.html
[3] http://blog.man7.org/2013/05/adding-further-man-pages-to-html.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
