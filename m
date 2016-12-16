From: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [pull request] Delete man pages that will migrate to the Linux man-pages project
Date: Fri, 16 Dec 2016 15:56:10 +0000
Message-ID: <29813.1481903770@warthog.procyon.org.uk>
References: <CAKgNAki0M5qT-Cim+vemGRJxfoSf+9Xeg1Tjz6DfsAgDkETfgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAki0M5qT-Cim+vemGRJxfoSf+9Xeg1Tjz6DfsAgDkETfgA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-ID: <29812.1481903770.1-S6HVgzuS8uM4Awkfq6JHfwNdhmdF6hFW@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> As discussed face-to-face and by email, there are a number of
> man pages in keyutils that document kernel APIs. The more natural
> home for these pages is Linux man-pages. I've already migrated
> the pages listed below into Linux man-pages, and subsequently
> enhanced various pages. They'll be released with the next release of
> man-pages (around the end of Feb 2017).
> 
> The following changes since commit ce92e974b8ecff19cf430b7b58a09b8190645b5c:
> 
>   TEST: Fix endianness determination (2016-02-26 10:07:00 +0000)
> 
> are available in the git repository at:
> 
>   http://git.kernel.org/pub/scm/linux/kernel/git/mtk/keyutils.git
> remove_migrated_man7
> 
> for you to fetch changes up to aedfce27baf51a776dc93e38b61df30eaee16003:
> 
>   man: Delete man pages that will migrate to the Linux man-pages
> project (2016-12-13 15:41:45 +0100)

Applied.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
