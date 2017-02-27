From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: man 1 getopts example code - wrong dash
Date: Mon, 27 Feb 2017 17:02:02 +0100
Message-ID: <58B44D7A.1090905@bfs.de>
References: <CADOJ=xsjhuZ7_r8JXgfcgXVRi-bf1gN9irBnOePra+i-xv9HuA@mail.gmail.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADOJ=xsjhuZ7_r8JXgfcgXVRi-bf1gN9irBnOePra+i-xv9HuA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcus Geiger <geiger.marcus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

i tried the example from http://man7.org/linux/man-pages/man1/getopts.1p.html
and it failed because some invisible chars where embedded

sh -x page.sh
+ aflag=
+ bflag=
+ getopts ab: name
+ '[' '!' $'\342\210\222z' '' ']'
page.sh: line 13: [: −z: unary operator expected
+ '[' '!' $'\342\210\222z' '' ']'
page.sh: line 16: [: −z: unary operator expected
page.sh: line 19: 1 − 1: syntax error: invalid arithmetic operator (error token is "− 1")

this does not happen when i clip the example rendered with groff (aka man).

i guess your problem may have the some origin.

re,
 wh


Am 27.02.2017 15:16, schrieb Marcus Geiger:
> Hello,
> 
> in the examples section of `man 1 getopts`, every dash/minus used in the
> example code cannot be parsed by bash. vi claims it's 0x2212 instead of 0x2d.
> 
> I'm on Ubuntu 16.04 with bash 4.3.46(1)-release. Unfortunately I couldn't find
> the source code for this man page, but the current online pages entry also has
> this problem: http://man7.org/linux/man-pages/man1/getopts.1p.html
> 
> The containing package is:
> 
>    $ dpkg -S $(man -w 1 getopts)
>    manpages-posix: /usr/share/man/man1/getopts.1posix.gz
> 
> Kind regards
> 
> Marcus Geiger
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
