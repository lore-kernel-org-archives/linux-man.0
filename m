From: Willy Tarreau <w@1wt.eu>
Subject: Re: Document accounting of FDs passed over UNIX domain sockets
Date: Sat, 17 Dec 2016 08:04:31 +0100
Message-ID: <20161217070431.GA13141@1wt.eu>
References: <68dec064-17bb-0994-8dcf-e06d54d80ada@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <68dec064-17bb-0994-8dcf-e06d54d80ada@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: linux-man <linux-man@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, socketpair@gmail.com, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

On Fri, Dec 16, 2016 at 12:08:33PM +0100, Michael Kerrisk (man-pages) wrote:
> Hello Willy,
> 
> Your commit 712f4aad406bb1 ("unix: properly account for FDs passed over 
> unix sockets" added accounting to ensure that the RLIMIT_NOFILE limit
> could not be bypassed when passing file descriptors across UNIX
> domain sockets.
> 
> Such patches should be CCed to linux-api@vger.kernel.org ;-)

Yes, I learned this after your presentation at kernel recipes, but this
patch pre-dates it ;-)

> A documentation [atch would be great as well, but I had a shot 
> at cobbling some text together. Does the text below (for the unix(7)
> man page) look okay?

I think so, though maybe we can arrange it very slightly given that
this was considered as a fix for a vulnerability and backported to
various kernels :

>        ETOOMANYREFS
>               This  error  can  occur  for sendmsg(2) when sending a file
>               descriptor as ancilary data over a UNIX domain socket  (see
>               the  description  of  SCM_RIGHTS, above).  It occurs if the
>               number  of  "in-flight"  file   descriptors   exceeds   the
>               RLIMIT_NOFILE  resource  limit and the caller does not have
>               the  CAP_SYS_RESOURCE  capability.    An   in-flight   file
>               descriptor  is  one that has been sent using sendmsg(2) but
>               has not yet been accepted in the  recipient  process  using
>               recvmsg(2).
> 
>               This error is diagnosed since Linux 4.5.  In earlier kernel
>               versions, it was possible to place an unlimited  number  of
>               file descriptors in flight, by sending each file descriptor
>               with sendmsg(2) and then closing  the  file  descriptor  so
>               that   it  was  not  accounted  against  the  RLIMIT_NOFILE
>               resource limit.

-               resource limit.
+               resource limit. Some older stable kernels might have
+               included the same check by backporting the fix from 4.5.

I've just checked the exact versions containing this, but I don't think
it's worth providing the list, in my opinion mentionning that it could be
observed on some older versions is enough to help developers who see it
in field :
  - 3.2.78
  - 3.10.99
  - 3.12.57
  - 3.14.63
  - 3.16.35
  - 3.18.27
  - 4.1.19
  - 4.4.4

Best regards,
Willy
