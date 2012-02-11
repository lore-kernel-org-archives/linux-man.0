From: Siddhesh Poyarekar <siddhesh.poyarekar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND][PATCH] Mark thread stack correctly in proc/<pid>/maps
Date: Sat, 11 Feb 2012 15:49:01 +0530
Message-ID: <CAAHN_R1=87w+NFXPA5MGER8wLR4LwOv-2_eG-d+Fe=+j08FKYQ@mail.gmail.com>
References: <20120116163106.GC7180@jl-vm1.vm.bytemark.co.uk>
	<1326776095-2629-1-git-send-email-siddhesh.poyarekar@gmail.com>
	<CAAHN_R2g9zaujw30+zLf91AGDHNqE6HDc8Z4yJbrzgJcJYFkXg@mail.gmail.com>
	<4F2B02BC.8010308@gmail.com>
	<CAAHN_R0O7a+RX7BDfas3+vC+mnQpp0h3y4bBa1u4T-Jt=S9J_w@mail.gmail.com>
	<CAHGf_=qA6EFue2-mNUg9udWV4xSx86XQsnyGV07hfZOUx6_egw@mail.gmail.com>
	<CAAHN_R0+ExGcdpLM7KwC_KsPOemVOiRrmyWcowiu5_cWW3BPLQ@mail.gmail.com>
	<CAAHN_R0N=3J4=VqvDsGB=_2Ln9yKBjOevW2=_UAMBK1pGepqvA@mail.gmail.com>
	<4F32B776.6070007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F32B776.6070007-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Feb 8, 2012 at 11:27 PM, KOSAKI Motohiro
<kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Now, we are using some bit saving hack. example,
>
> 1) use ifdef
>
> #ifndef CONFIG_TRANSPARENT_HUGEPAGE
> #define VM_MAPPED_COPY 0x01000000 =A0 =A0 =A0/* T if mapped copy of d=
ata (nommu
> mmap) */
> #else
> #define VM_HUGEPAGE =A0 =A00x01000000 =A0 =A0 =A0/* MADV_HUGEPAGE mar=
ked this vma */
> #endif
>
> 2) use bit combination
>
> #define VM_STACK_INCOMPLETE_SETUP =A0 =A0 =A0(VM_RAND_READ | VM_SEQ_R=
EAD)
>
>
> Maybe you can take a similar way. And of course, you can ban some use=
less
> flag
> bits.

I found the thread in which Linus rejected the idea of expanding vm_fla=
gs:

https://lkml.org/lkml/2011/11/10/522

and based on that, I don't think I can justify the need for a new flag
for this patch since it is purely for display purposes and has nothing
to do with the actual treatment of the vma. So I figured out another
way to identify a thread stack without changing the way the vma
properties (I should have done this in the first place I think) which
is by checking if the vma contains the stack pointer of the task.

With this change:

/proc/pid/task/tid/maps: will only mark the stack that the task uses

/proc/pid/maps: will mark all stacks. This path will be slower since
it will iterate through the entire thread group for each vma.

I'll test this and attach a new version of the patch.

Regards,
Siddhesh

--=20
Siddhesh Poyarekar
http://siddhesh.in
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
