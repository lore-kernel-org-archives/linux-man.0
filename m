From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] open.2: Clarify which create mode bits are relevant
Date: Tue, 21 Apr 2015 15:02:09 +0200
Message-ID: <CAHpGcMLAphV8v0yPsuoiDjtG6Vqfy8wvrFTk23_mjZNAqjpwzA@mail.gmail.com>
References: <fe89279fbad286454188b3146b311442cdb7401f.1428946673.git.andreas.gruenbacher@gmail.com>
	<553644D4.2050905@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <553644D4.2050905-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Michael,

thanks for your further improvements. I agree with most of them, some
things didn't go so well though:


Commit "stat.2: Tighten wording: use 'mode bit' rather than
'permission bit'" is bad:

The stat man page distinguishes between the "file type component" and
"file permissions component" of the mode; now this distinction is
broken. Also, the second sentence now even makes less sense (not that
it did make much sense before):

"According to POSIX.1-2001, lstat() on a symbolic link need return
valid information only in the st_size field and the file-type
component of the st_mode field of the stat structure.  POSIX.1-2008
tightens the specification, requiring lstat() to return valid
information in all fields except the mode bits in st_mode."

My guess wuold be that POSIX.1-2008 actually requires valid permission
bits as well.


Commit "mkdir.2: Fix a small error added by Andreas's patch" is also bad:

The mkdir(2) man page was describing the general behavior under
DESCRIPTION and the Linux behavior under NOTES; it should still do so
but now it doesn't anymore.


Thanks,
Andreas
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
