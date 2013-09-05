From: Christoph Lameter <cl-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clock_getres.2: Remove obsolete note on SMP systems
Date: Thu, 5 Sep 2013 14:22:09 +0000
Message-ID: <00000140ee806e2a-6ac74d68-f5d8-4330-ab1c-fd8dd3a8ada3-000000@email.amazonses.com>
References: <1378202731-29738-1-git-send-email-rodrigo@sdfg.com.ar> <1378202731-29738-2-git-send-email-rodrigo@sdfg.com.ar> <CAKgNAkj_SumnwDQ=rxSBubybzOSTS9u0RjDBSR-1=KrTK7=L_A@mail.gmail.com> <20130904133217.GC12620@sdfg.com.ar>
 <CAKgNAkjwVc3HLOL0n5upE5rOgqCN3TYGacrWMOzJ=uyv1mbHUg@mail.gmail.com> <00000140e9b4ede6-8b9dfd6f-7ca2-4d35-9454-389f6453031a-000000@email.amazonses.com> <20130904160815.GA15601@sdfg.com.ar> <00000140e9df10cd-71ca0078-fe11-4a8d-b588-93c2dfff098f-000000@email.amazonses.com>
 <20130905081018.GA25617@sdfg.com.ar>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130905081018.GA25617-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, 5 Sep 2013, Rodrigo Campos wrote:

> If that is the case, should we change the note to say since which glibc (do we
> care about any other libc?) and kernel version these are safe on SMP and keep
> the note for people using olders version ?

Right. Some older glibc versions will always handle these clock request in
user space. Old RH4 and certain old SUSE versions were some of the main
issues.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
