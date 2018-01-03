From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cgroups.7: tfix
Date: Wed, 3 Jan 2018 01:40:56 +0100
Message-ID: <f8b17c89-f048-a9ec-419f-37084c5b0229@gmail.com>
References: <20180102225532.894-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180102225532.894-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jakub,

On 01/02/2018 11:55 PM, Jakub Wilk wrote:
> Remove duplicated words.

Thanks for the patch. As it happens, I've already fixed this in a branch
that has not yet been merged into 'master'.

Cheers,

Michael


> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man7/cgroups.7 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/man7/cgroups.7 b/man7/cgroups.7
> index 9d402d1c7..662e3ac33 100644
> --- a/man7/cgroups.7
> +++ b/man7/cgroups.7
> @@ -603,7 +603,7 @@ This is the same as the version 1
>  controller.
>  .TP
>  .IR perf_event " (since Linux 4.11)"
> -This is the same as the the version 1
> +This is the same as the version 1
>  .I perf_event
>  controller.
>  .TP
> @@ -813,7 +813,7 @@ can move processes into the root of the delegated subtree.
>  .TP
>  .IR /grp1/cgroup.subtree_control
>  Making this file owned by the delegatee is optional.
> -Doing so means that that the delegatee can enable controllers
> +Doing so means that the delegatee can enable controllers
>  (that are present in
>  .IR /grp1/cgroup.controllers )
>  in order to further redistribute resources at lower levels in the subtree.
> @@ -838,7 +838,7 @@ and move processes between cgroups in the subtree.
>  If some controllers are present in
>  .IR grp1/cgroup.subtree_control ,
>  or the ownership of that file was passed to the delegatee,
> -the the delegatee can also control the further redistribution
> +the delegatee can also control the further redistribution
>  of the corresponding resources into the delegated subtree.
>  .PP
>  Some delegation
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
