From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [man-pages PATCH 1/5] s390_runtime_instr.2: note that
 runtime_instr.h is not a public header
Date: Mon, 22 Jan 2018 13:11:19 +0000
Message-ID: <CACGkJduJ2SyWVZ7b-obLC_sB5TwHRfdpdfY5qDGrpzGgTC-H+A@mail.gmail.com>
References: <20180114185622.GA23506@asgard.redhat.com> <20180120112839.GB6287@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180120112839.GB6287@osiris>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, Jan 20, 2018 at 11:28 AM, Heiko Carstens
<heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org> wrote:
> IMHO we shouldn't document the file name of a kernel header that is not
> exported. It's name and location can change anytime. I will move the kernel
> header file to the uapi directory where it should have been since a long
> time.

In that case, I think it could be rephrased to something like "the
header asm/runtime_instr.h is available for the userspace programs
since Linux 4.15, before that it was located in
arch/s390/include/asm/runtime_instr.h in the kernel's source tree", as
man-pages project (as I understood) tends to reference places in
kernel's source tree if it is deemed useful; it is usually applied to
documentation files, however, although they also have tendency to
migrate over time.

-- 
Eugene Syromyatnikov
mailto:evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
xmpp:esyr@jabber.{ru|org}
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
