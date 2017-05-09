From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] un-document "URL" macro in man(7)
Date: Tue, 9 May 2017 19:04:15 +0200
Message-ID: <bd5ca37b-1d70-9f46-db7d-5a4514703cd0@gmail.com>
References: <20170506024950.e77fxxftbdgadnna@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170506024950.e77fxxftbdgadnna-Z0uaYDh/Ni4SozaZsD9aTtHuzzzSOjJt@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Branden,

On 05/06/2017 04:49 AM, G. Branden Robinson wrote:
> According to my greps, the .URL macro is nowhere used in the man-pages
> project.  .UR and .UE, from the groff man macros, are used 73 times.
> 
> Please find attached a patch to un-document .URL in favor of .UR and
> .UE.

Thanks! I fixed most URLs quite a while ago to use .UR/.UE, but
overlooked to fix man(7). Patch applied.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
