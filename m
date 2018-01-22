From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [man-pages PATCH 2/5] s390_runtime_instr.2: document the removal
 of the second argument
Date: Mon, 22 Jan 2018 13:16:25 +0000
Message-ID: <CACGkJduq-h=RdranSq_jbg3g65dKPLa5+P-85kR4Z+nFyfYe0w@mail.gmail.com>
References: <20180114185627.GA23602@asgard.redhat.com> <20180120114126.GC6287@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180120114126.GC6287@osiris>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, Jan 20, 2018 at 11:41 AM, Heiko Carstens
<heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org> wrote:
> If you now document the above people will start using the system call with
> only one parameter which isn't backwards compatible.
>
> I'd rather add the second parameter again to the system call so that code
> stays backwards compatible.

Well, it ought to be documented somehow, especially if the syscall
parameter will be added back, as there could be situation where
application gets successful return code for the call non-zero value of
the second argument and gets no signals as it is the one of the kernel
releases where this parameter was removed. I can update the patch to
reflect this once the patch that returns the second argument reaches
the kernel tree.

-- 
Eugene Syromyatnikov
mailto:evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
xmpp:esyr@jabber.{ru|org}
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
