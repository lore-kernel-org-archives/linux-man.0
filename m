From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: posix_memalign
Date: Wed, 04 Sep 2013 08:11:24 +0200
Message-ID: <5226CF0C.5050908@gmail.com>
References: <CAGc9EvdXthzgBYEV=zpq+POQypCN_ePs0g3tksz6jC71zBDr+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9EvdXthzgBYEV=zpq+POQypCN_ePs0g3tksz6jC71zBDr+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jon,

On 09/03/13 19:32, Jon Grant wrote:
> Hello
> 
> I have a proposal to change the description on this page to be clearer:
> http://man7.org/linux/man-pages/man3/posix_memalign.3.html
> 
> Currently:
> 
> "If size is 0, then
> posix_memalign() returns either NULL, or a unique pointer value that
> can later be successfully passed to free(3)."
> 
> --As posix_memalign doesn't "return" the value, but places the address
> in *memptr I propose to change it to:
> 
> "If size is 0, then
> posix_memalign() either places NULL in *memptr, or a unique pointer value that
> can later be successfully passed to free(3)."

By chance, someone else recently reported this (offlist), and I 
made a change (commit 558f02dff03b5835d9f83f20b2056f38c6238a36).

Cheers,

Michael

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
