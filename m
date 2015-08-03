From: Rich Felker <dalias@libc.org>
Subject: Re: For review: nptl(7) man page
Date: Mon, 3 Aug 2015 16:08:25 -0400
Message-ID: <20150803200825.GJ16376@brightrain.aerifal.cx>
References: <550ED3F4.1080403@gmail.com>
 <550F363B.801@gmail.com>
 <55B1EFFA.9070608@gmail.com>
 <CAODz2cDq4o85NOzqCDg9cH8eCvqt3Tq5QXKMMJtXbik5h5bL+Q@mail.gmail.com>
 <55B54215.6070502@gmail.com>
 <1438616740.20974.81.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-61595-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
Content-Disposition: inline
In-Reply-To: <1438616740.20974.81.camel@localhost.localdomain>
To: Torvald Riegel <triegel@redhat.com>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Nicholas Miell <nmiell@gmail.com>, linux-man@vger.kernel.org, libc-alpha@sourceware.org, Carlos O'Donell <carlos@redhat.com>
List-Id: linux-man@vger.kernel.org

On Mon, Aug 03, 2015 at 05:45:40PM +0200, Torvald Riegel wrote:
> On Sun, 2015-07-26 at 22:24 +0200, Michael Kerrisk (man-pages) wrote:
> > On 07/24/2015 05:51 PM, Nicholas Miell wrote:
> > > PTHREAD_PROCESS_SHARED says any thread with access to the memory containing
> > > the mutex can operate on the mutex and POSIX basically ignores the idea
> > > that different processes could be running completely incompatible
> > > executables or whatever.
> > > 
> > > pthread_mutex_t has a bunch of #ifdefs in the middle of it that change the
> > > structure size and layout between i386 and x86_64.
> > > 
> > > Most importantly, the positions of the __nusers and __kind fields are
> > > swapped (this looks to be an oversight dating back to 2003 when __nusers
> > > was first introduced and carefully preserved when the separate i386 and
> > > x86_64 versions of pthreadtypes.h were merged into the single x86 version),
> > > which means that when the lock and unlock functions attempt to figure out
> > > what kind of mutex it is (recursive/adaptive/whatever), they'll look at the
> > > wrong field if the mutex is from the wrong architecture and then things
> > > will break.
> > > 
> > > And then there's the fact that the rest of the struct is a union in the
> > > 32-bit version and flat in the 64-bit version, but that could have been
> > > worked around if you put a flag in the __kind field that tells the 64-bit
> > > pthread library that it is looking at a 32-bit mutex.
> > 
> > Thanks for the additional detail, Nicholas. So, how about a paragraph such 
> > as the following for the manual page:
> > 
> >        POSIX says that any thread in any process with access to the mem‐
> >        ory containing a  process-shared  (PTHREAD_PROCESS_SHARED)  mutex
> >        can  operate  on that mutex.  However, on 64-bit x86 systems, the
> >        mutex definition for x86-64 is incompatible with the mutex  defi‐
> >        nition  for  i386,  meaning that 32-bit and 64-bit binaries can't
> >        share mutexes on x86-64 systems.
> 
> In general, I don't think we promise that one can use share
> PTHREAD_PROCESS_SHARED data structures between processes that do not use
> the same glibc.  A 32b glibc build and an x86_64 build will differ
> (e.g., the new semaphore implemenation uses a different algorithm if 64b
> atomic operations are available instead of just 32b ones).  The sizes
> and aligment of the data structures are ABI, but I do not believe that
> the way in that glibc uses those bits is part of the ABI too.
> 
> However, I haven't checked whether POSIX makes any statements about this
> situation.

It doesn't directly. If you consider the models as two separate
"compilation environments"/"execution environments" of the same
implementation, then it would at least be within the scope of POSIX to
have something to say about it. On the other hand if you consider them
as completely separate implementations that just happen to run (as
foreign binaries) on the same logical/physical machine, it's well
outside the scope of POSIX whether this works.

Rich
