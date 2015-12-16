From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: The time(2) man page conflicts with glibc
Date: Wed, 16 Dec 2015 14:38:51 +0100
Message-ID: <5671696B.3070203@gmail.com>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>	<mvmegen94qs.fsf@hawking.suse.de> <CAMe9rOr_Ydg5Nr7aV8vS0vYEFehSwFBuxrMAnCFXyyVoTF4vJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-65679-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <CAMe9rOr_Ydg5Nr7aV8vS0vYEFehSwFBuxrMAnCFXyyVoTF4vJQ@mail.gmail.com>
To: "H.J. Lu" <hjl.tools@gmail.com>, Andreas Schwab <schwab@suse.de>
Cc: mtk.manpages@gmail.com, libc-alpha <libc-alpha@sourceware.org>, linux-man <linux-man@vger.kernel.org>, Mike Frysinger <vapier@gentoo.org>, Zack Weinberg <zackw@panix.com>
List-Id: linux-man@vger.kernel.org

On 12/15/2015 03:17 PM, H.J. Lu wrote:
> On Tue, Dec 15, 2015 at 6:16 AM, Andreas Schwab <schwab@suse.de> wrote:
>> In which way does it conflict?
> 
> On error, ((time_t) -1) is returned, and errno is set appropriately.


So, how would the following text be for the man page?

    ERRORS
       EFAULT t  points  outside your accessible address space.  On sys‐
              tems where the C library time() wrapper  function  invokes
              an  implementation  provided by the vdso(7) (so that there
              is no trap  into  the  kernel),  an  invalid  address  may
              instead trigger a SIGSEGV signal.

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
