From: Eugene Syromiatnikov <esyr@redhat.com>
Subject: Re: [PATCH] execve.2: document an effect of BINPRM_BUF_SIZE increase
 to 256
Date: Thu, 22 Nov 2018 18:32:45 +0100
Message-ID: <20181122173245.GF20018@asgard.redhat.com>
References: <20181116174911.6fcff580@alans-desktop>
 <20181121160753.GA32685@asgard.redhat.com>
 <CAKgNAkhFikJXeOx3W3yL3EUKa9ruXtAw93m4M=N+3Kg-bXbPDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkhFikJXeOx3W3yL3EUKa9ruXtAw93m4M=N+3Kg-bXbPDQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: linux-man <linux-man@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Ben Woodard <woodard@redhat.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>
List-Id: linux-man@vger.kernel.org

On Thu, Nov 22, 2018 at 04:59:24PM +0100, Michael Kerrisk (man-pages) wrote:
> Hi Eugene,
> 
> On Wed, 21 Nov 2018 at 17:07, Eugene Syromiatnikov <esyr@redhat.com> wrote:
> >
> > Increase of BINPRM_BUF_SIZE to 256 increases the limit on the possible
> > interpreter line length for scripts to 255.
> 
> I don't see this in the kernel source tree? Could you point me at the
> right source file / git commit?

Sorry, it's a corresponding man page update for a proposed kernel
change[1][2], and I failed to Cc: all the related parties properly.

[1] https://lkml.org/lkml/2018/11/12/2330
[2] https://lkml.org/lkml/2018/11/12/2328

> Thanks,
> 
> Michael
> 
> > Signed-off-by: Eugene Syromiatnikov <esyr@redhat.com>
> > ---
> >  man2/execve.2 | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/man2/execve.2 b/man2/execve.2
> > index d2bb861..f4e37d6 100644
> > --- a/man2/execve.2
> > +++ b/man2/execve.2
> > @@ -633,8 +633,9 @@ prototype:
> >  .in
> >  .\"
> >  .SS Interpreter scripts
> > -A maximum line length of 127 characters is allowed for the first line in
> > -an interpreter script.
> > +Before Linux 4.20, a maximum line length of 127 characters was allowed
> > +for the first line in an interpreter script.
> > +In Linux 4.20 onwards, this limit was increased up to 255 characters.
> >  .PP
> >  The semantics of the
> >  .I optional-arg
> > --
> > 2.1.4
> >
> 
> 
> -- 
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
