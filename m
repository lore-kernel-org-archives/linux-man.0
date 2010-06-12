From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] [2/3] Add missing migrate_pages manpage
Date: Sat, 12 Jun 2010 17:28:14 +0200
Message-ID: <AANLkTim--EbPhKxja75Iz8ZRe56s2LTCeP93uLNM4lff@mail.gmail.com>
References: <20091106652.255147301@firstfloor.org> <20091106175212.4368EB1627@basil.firstfloor.org>
	<alpine.DEB.1.10.0911061257171.5187@V090114053VZO-1>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.1.10.0911061257171.5187@V090114053VZO-1>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Lameter <cl-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Christoph,

A long time after the fact, but...

On Fri, Nov 6, 2009 at 8:01 PM, Christoph Lameter
<cl-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org> wrote:
> On Fri, 6 Nov 2009, Andi Kleen wrote:
>
>> +moves all pages of the process
>> +.I pid
>> +that are in memory nodes
>> +.I old_nodes
>> +to
>> +.I new_nodes.
>> +Pages not placed in any node in
>
> in -> on?
>
>> +Use
>> +.BR get_mempolicy (2)
>> +with the
>> +.B MPOL_F_MEMS_ALLOWED
>> +flag to obtain the set of nodes that are allowed by
>> +.\" FIXME Clarify "current cpuset". =A0Is that the cpuset of the ca=
ller
>> +.\" or the target?
>> +the current cpuset.
>
> get_mempolicy is restricted to the cpuset of the caller. What target?
>
> If you are talking about migrate_pages() then the restriction is that=
 the
> targets have to be within the callers cpuset.

Thanks for that clarification. I have added it to the current draft of =
the page.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
