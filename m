From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] Trivialities
Date: Wed, 04 Jun 2014 20:54:44 +0200
Message-ID: <538F6B74.5020903@gmail.com>
References: <1401899608-30515-1-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401899608-30515-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/04/2014 06:33 PM, Rasmus Villemoes wrote:
> Rasmus Villemoes (4):
>   getdate.3: Use blank definition of _GNU_SOURCE
>   open_by_handle_at.2: Add reference to feature_test_macros(7)
>   recvmmsg.2: Add reference to feature_test_macros(7)
>   sendmmsg.2: Add reference to feature_test_macros(7)
> 
>  man2/open_by_handle_at.2 | 2 +-
>  man2/recvmmsg.2          | 2 +-
>  man2/sendmmsg.2          | 2 +-
>  man3/getdate.3           | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Small stuff like this often goes unnoticed for ages before it gets noticed
and fixed. Thanks for catching this and sending the patches, Rasmus.

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
