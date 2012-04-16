From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH/RFC 0/6] ld.so.8: some improvements from Debian
Date: Mon, 16 Apr 2012 12:24:08 -0500
Message-ID: <20120416172408.GT5813@burratino>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
 <CAKgNAkgbcL3deJ4x0DEV==vtiAmYie7+Gw+c=K_dAJhWE4va1Q@mail.gmail.com>
 <20120416165806.GR5813@burratino>
 <CAKgNAkj0BAKbP6SrohCEG+eeEAZAYkJ6NA9Jvi0hS2j3e19mmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkj0BAKbP6SrohCEG+eeEAZAYkJ6NA9Jvi0hS2j3e19mmg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-WSSlzXzs9B4@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Michael Kerrisk (man-pages) wrote:

> Could you possibly also rearchitect the patch series please, in the
> light of the following:
> * There have been a (very) few changes to upstream ld.so.8, so you'll
> need to rebase.

Sure, no problem.

> * Please clearly separate out those pieces that simply bridge the gap
> between upstream ld.so.8 and Debian ld.so.8 and those pieces that are
> your own enhancements. (I did correctly understand that there are some
> of those, right?).

Do I understand correctly that you want first a patch that makes it look
just like Debian's ld.so.8, and after that patches that make it more
palatable?  That doesn't seem quite right to me --- for example, it would
mean first reverting the changes to upstream ld.so.8 and then reapplying
them again.

Jonathan
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
