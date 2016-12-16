From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Document accounting of FDs passed over UNIX domain sockets
Date: Fri, 16 Dec 2016 12:08:33 +0100
Message-ID: <68dec064-17bb-0994-8dcf-e06d54d80ada@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Willy Tarreau <w@1wt.eu>
Cc: mtk.manpages@gmail.com, linux-man <linux-man@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, socketpair@gmail.com, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hello Willy,

Your commit 712f4aad406bb1 ("unix: properly account for FDs passed over 
unix sockets" added accounting to ensure that the RLIMIT_NOFILE limit
could not be bypassed when passing file descriptors across UNIX
domain sockets.

Such patches should be CCed to linux-api@vger.kernel.org ;-)

A documentation [atch would be great as well, but I had a shot 
at cobbling some text together. Does the text below (for the unix(7)
man page) look okay?

Cheers,

Michael

       ETOOMANYREFS
              This  error  can  occur  for sendmsg(2) when sending a file
              descriptor as ancilary data over a UNIX domain socket  (see
              the  description  of  SCM_RIGHTS, above).  It occurs if the
              number  of  "in-flight"  file   descriptors   exceeds   the
              RLIMIT_NOFILE  resource  limit and the caller does not have
              the  CAP_SYS_RESOURCE  capability.    An   in-flight   file
              descriptor  is  one that has been sent using sendmsg(2) but
              has not yet been accepted in the  recipient  process  using
              recvmsg(2).

              This error is diagnosed since Linux 4.5.  In earlier kernel
              versions, it was possible to place an unlimited  number  of
              file descriptors in flight, by sending each file descriptor
              with sendmsg(2) and then closing  the  file  descriptor  so
              that   it  was  not  accounted  against  the  RLIMIT_NOFILE
              resource limit.


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
