From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Moving attr(5) man page to man-pages
Date: Wed, 22 Apr 2015 10:55:42 +0200
Message-ID: <5537620E.3000601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, acl-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, base-system-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org, Christophe-MeO/4o4RY/8dnm+yROfE0A@public.gmane.org, Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Eduardo Madeira Fleury <efleury-xuelUoVDAHHQT0dZR+AlfA@public.gmane.org>, manpages-fr maintainer <manpagesfr-GANU6spQydw@public.gmane.org>, =?UTF-8?B?R2l1bGlvIERhcHJlbMOg?= <giulio-pvpjhgE6P/E@public.gmane.org>, "Martin (Joey) Schulze" <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, Mohsen Pahlevanzadeh <mohsen-iPr4nGsj6FvziFbYTSYfcdi2O/JbrIOy@public.gmane.org>, Alain Portal <alain.portal-CD6X2pywdrkGaKE8qFNMvg@public.gmane.org>, Petr Gajdos <PGajdos-AlSwsSmVLrQ@public.gmane.org>, Ruediger Oertel <ro-l3A5Bk7waGM@public.gmane.org>, Aleksandr Blokhin <sass-u2l5PoMzF/Uox3rIn2DAYQ@public.gmane.org>, Jan Haloup <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, Kaveh Mousavi <kavehmz-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Stepan Kasal <kasal-+ZI9xUNit7I@public.gmane.org>, Marco Curreli <marcocurreli-IWqWACnzNjyonA0d6jMUrA@public.gmane.org>"Michael Kerrisk (gmail)" <mtk>
List-Id: linux-man@vger.kernel.org

Hi Andreas,

As we discussed offlist, it makes sense to have the attr(5) man 
page in man-pages, rather than as part of the 'attr' project 
documentation, since it mostly relates to kernel details.

So, I'll adopt this page for the next man-pages release; I've
just now copied the latest version from the 'attr' repo. Could
you please take whatever steps are needed ensure that page 
conflicts do not result for downstreams who are taking man 
page feeds from both projects.

I'll move this page into Section 7, since that's where overview
type pages such as this are normally placed in man-pages, but 
I'll also create a link in Section 5, so that acl(5) references
will continue to work.

I've made a number of edits to the page. Some of these were just 
to bring the page closer to man-pages style, but others were to
amend incorrect technical details and add new details. I'd be
pleased if you checked over these commits:

d8ba769 attr.7: File capabilities are implemented using *security* attributes
03a93c3 attr.7: Clarify permissions required to work with 'user' EAs
6ad46a9 attr.7: The ext[234] block limitation applies to sum of all EAs
6db035a attr.7: Document VFS-imposed limits on EAs
edb159d attr.7: Describe limit on EA values for JFS, XFS, and Reiserfs
7f4f24e attr.7: Document EA limits for Btrfs

These changes are already pushed to 'master' at
http://git.kernel.org/pub/scm/docs/man-pages/man-pages

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
