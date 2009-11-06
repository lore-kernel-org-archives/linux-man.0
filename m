From: Christoph Lameter <cl-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [PATCH] [2/3] Add missing migrate_pages manpage
Date: Fri, 6 Nov 2009 13:01:07 -0500 (EST)
Message-ID: <alpine.DEB.1.10.0911061257171.5187@V090114053VZO-1>
References: <20091106652.255147301@firstfloor.org> <20091106175212.4368EB1627@basil.firstfloor.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091106175212.4368EB1627-Oisruko67ZwogZNkvFMw5WD2FQJk+8+b@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, 6 Nov 2009, Andi Kleen wrote:

> +moves all pages of the process
> +.I pid
> +that are in memory nodes
> +.I old_nodes
> +to
> +.I new_nodes.
> +Pages not placed in any node in

in -> on?

> +Use
> +.BR get_mempolicy (2)
> +with the
> +.B MPOL_F_MEMS_ALLOWED
> +flag to obtain the set of nodes that are allowed by
> +.\" FIXME Clarify "current cpuset".  Is that the cpuset of the caller
> +.\" or the target?
> +the current cpuset.

get_mempolicy is restricted to the cpuset of the caller. What target?

If you are talking about migrate_pages() then the restriction is that the
targets have to be within the callers cpuset.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
