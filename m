From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: Bug in crypt(3) man page
Date: Sun, 6 Jun 2010 12:44:55 +0200
Message-ID: <20100606104455.GF16800@machine.or.cz>
References: <20100605114404.GA30106@cisunix.unh.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100605114404.GA30106-gUudzVX/zFgk2GylmosdeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul A Sand <pas-JNhspZqLHXk@public.gmane.org>
Cc: mtk-manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Jun 05, 2010 at 07:44:05AM -0400, Paul A Sand wrote:
> Hi --
> 
> I have version 3.23 of man-pages (Fedora 13). At the very
> end of 'Glibc Notes' of crypt(3):
> 
>     In the SHA implementation the entire key is significant
>     (instead of only the first 8 bytes in MD5).
> 
> I'm pretty sure that's incorrect. I think both MD5 and SHA implementations
> use the whole key, and the 8-byte significance restriction is
> applies to (just) the original DES. 

Thanks, this shold be already fixed in the git version.

> The man page also may be incorrect with the max salt lengths.
> I think this is eight bytes for MD5, 16 for SHA-256 and SHA-512.
> (The page implies 16 for MD5 too.)

I think the manpage is not strictly wrong here, though it could be more
detailed; patches are welcome.

-- 
				Petr "Pasky" Baudis
The true meaning of life is to plant a tree under whose shade
you will never sit.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
