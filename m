From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mbind.2: Update MPOL_BIND section
Date: Sun, 12 Mar 2017 10:46:54 +0100
Message-ID: <55c65381-8f92-cbd4-75e6-d482764ff258@gmail.com>
References: <1489149118-171304-1-git-send-email-krzysztof.kulakowski@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489149118-171304-1-git-send-email-krzysztof.kulakowski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: krzysztof.kulakowski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Krzysztof,

Thanks for the patch. I've applied, except for one piece noted 
below.

On 03/10/2017 01:31 PM, krzysztof.kulakowski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org wrote:
>  If
>  .I nodemask
>  specifies more than one node, page allocations will come from
> -the node with the lowest numeric node ID first, until that node
> -contains no free memory.
> -Allocations will then come from the node with the next highest
> -node ID specified in
> -.I nodemask
> -and so forth, until none of the specified nodes contain free memory.

I believe that removing the following sentence is incorrect, and
I have retained the sentence:

> -Pages will not be allocated from any node not specified in the
> -.IR nodemask .

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
