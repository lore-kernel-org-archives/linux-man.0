From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH] ptrace.2: Improve clarity for multi-threaded tracers
Date: Mon, 25 Feb 2019 16:51:10 +0100
Message-ID: <CAKgNAkhNCE24+QEYpQjcAjN2ktQe_JdAd7sP9rHR90iA228-yw@mail.gmail.com>
References: <48bb7c89-abb9-1e88-fee3-fb42d4032d12@nh2.me> <bfa474c6-5b13-652d-2fd8-16b2be7efb62@nh2.me>
 <20190217221523.GA9233@altlinux.org>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190217221523.GA9233@altlinux.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_Hamb=C3=BCchen?= <mail@nh2.me>
Cc: "Dmitry V. Levin" <ldv@altlinux.org>, lkml <linux-kernel@vger.kernel.org>, cleverca22@gmail.com, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Hi Niklas,

Do you plan to revise this patch in the light of Dmitry's comments?

Thanks,

Michael

On Sun, 17 Feb 2019 at 23:15, Dmitry V. Levin <ldv@altlinux.org> wrote:
>
> Hi,
>
> On Sun, Feb 17, 2019 at 05:34:46PM +0100, Niklas Hamb=C3=BCchen wrote:
> > Until now, the man page said:
> >
> >     Attachment and subsequent commands are per thread:
> >     in a multi=E2=80=90 threaded process, every thread can be individua=
lly attached to a
> >     (potentially different) tracer, or left not attached and thus not d=
ebugged.
> >     Therefore, "tracee" always means "(one) thread", never "a (possibly
> >     multithreaded) process".
> >
> > While the first sentence "Attachment ... [is] per thread" might be inte=
rpreted
> > as holding for both tracer and tracee, the rest talks only about the
> > multi-threadedness of the *tracee*, leaving some uncertainty in the rea=
der on
> > whether the tracer may issue `ptrace()` from different threads.
> >
> > This patch adds more explicitness, removing any doubt.
>
> Thanks for making an attempt to remove any doubt.
>
> Yes, ptrace'ing is per task_struct on both sides.
>
> > Relevant resources:
> >
> > * LKML thread https://marc.info/?l=3Dlinux-kernel&m=3D155036848808748&w=
=3D2
> >   "ptrace() with multithreaded tracer"
> >   where I asked about this behaviour, in case anybody disagrees with my
> >   understanding
> > * https://stackoverflow.com/questions/18737866/can-a-thread-trace-a-pro=
cess/
> >   where the previous ambiguity of the man page confused some users, and=
 where
> >   and example program is given that confirms the behaviour I mention in=
 this
> >   patch
> > * A program of mine, in which I have independently confirmed that using
> >   `ptrace()` from a thread that's not the tracer thread (a sibling thre=
ad in
> >   the process is the tracer instead) results in `ESRCH`
> > * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/kernel/ptrace.c?id=3D96d4f267e40f9509e8a66e2b39e8b95655617693#n207
> >   where the comment on `ptrace_check_attach()` talks about `%current`, =
which
> >   is a thread
> >
> > Signed-off-by: Niklas Hamb=C3=BCchen <mail@nh2.me>
> > ---
> >  man2/ptrace.2 | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/man2/ptrace.2 b/man2/ptrace.2
> > index 3b6b6ea84..4058abe94 100644
> > --- a/man2/ptrace.2
> > +++ b/man2/ptrace.2
> > @@ -122,12 +122,18 @@ It is primarily used to implement breakpoint debu=
gging and system
> >  call tracing.
> >  .PP
> >  A tracee first needs to be attached to the tracer.
> > -Attachment and subsequent commands are per thread:
> > -in a multithreaded process,
> > +Attachment and subsequent commands are per thread,
> > +on both the tracer and tracee side.
> > +Issuing a tracing command from a thread that is not the tracer of the =
given
> > +.I pid
> > +will result in an
> > +.B ESRCH
> > +error.
>
> This is confusing.  What do you mean by a tracing command?
> Is PTRACE_TRACEME a tracing command?  PTRACE_ATTACH?  PTRACE_SEIZE?
>
> I suggest leaving the explanation of ptrace return code to "ERRORS"
> section.
>
> > +In a multithreaded process to be traced,
> >  every thread can be individually attached to a
> >  (potentially different) tracer,
> >  or left not attached and thus not debugged.
> > -Therefore, "tracee" always means "(one) thread",
> > +Therefore, "tracer" or "tracee" always mean "(one) thread",
> >  never "a (possibly multithreaded) process".
> >  Ptrace commands are always sent to
> >  a specific tracee using a call of the form
> > @@ -2259,7 +2265,7 @@ or (on kernels before 2.6.26) be
> >  .TP
> >  .B ESRCH
> >  The specified process does not exist, or is not currently being traced
> > -by the caller, or is not stopped
> > +by the calling thread, or is not stopped
> >  (for requests that require a stopped tracee).
> >  .SH CONFORMING TO
> >  SVr4, 4.3BSD.
>
> I agree the current text can be made more clear on the subject,
> but, unfortunately, proposed change makes the description more confusing.
>
>
> --
> ldv



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
