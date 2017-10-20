From: Pedro Alves <palves@redhat.com>
Subject: Re: Draft pthread_spin_lock(3) manual page
Date: Fri, 20 Oct 2017 11:12:52 +0100
Message-ID: <2d177560-7725-066a-7fff-bac06b9d153a@redhat.com>
References: <CAKgNAkigca=v31L0hDMR7PdNEHgS8mhB6KWR0qZew-jhYD8dwg@mail.gmail.com>
 <fe6d752e-60a1-c8de-698c-ddd19d432110@redhat.com>
 <CAKgNAkjTZZWQpAwgg-m7Z-W=CQfS39CU5F+rr1B3msgf4SEBww@mail.gmail.com>
 <CAKCAbMjZK6BwJeh37TyJkwogD05GdvQod6LkJmvy4R+ad1w7fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-86175-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <CAKCAbMjZK6BwJeh37TyJkwogD05GdvQod6LkJmvy4R+ad1w7fw@mail.gmail.com>
To: Zack Weinberg <zackw@panix.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Carlos O'Donell <carlos@redhat.com>, linux-man <linux-man@vger.kernel.org>, "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>
List-Id: linux-man@vger.kernel.org

On 10/19/2017 07:06 PM, Zack Weinberg wrote:
> On Thu, Oct 19, 2017 at 1:46 PM, Michael Kerrisk (man-pages)

> I meant to reply earlier.  This is a pet English grammar peeve of
> mine: "shall" is a _directive_.  Specifications use it because they
> are directing the implementors to make things happen, but in
> documentation aimed at people _using_ an interface, the appropriate
> word is "will".  The function _will_ fail and set errno under the
> following conditions yada yada.  That's what it does.  You, the reader
> of this manpage, do not have to do anything to make that happen.

Technical writing guidelines usually suggest staying in the
present tense, and avoid future tense though, because with "will"
it's not clear whether you're describing how things behave as
currently implemented or whether you're talking about how things
will be implemented in the future.

I.e.:
  ... foo fails and sets errno if/when ...
instead of:
  ... foo will fail and set errno if/when ...

Here's an example:


http://www.datacenterjournal.com/technically-write-advice-technical-writing/

And here's Sandra applying that same rule throughout GCC's manual:

 [[doc] extend.texi copy-editing, 1/N (verb tenses)]
 https://gcc.gnu.org/ml/gcc-patches/2012-10/msg02688.html

(I recalled that whole series of Sandra's as I found
it quite instructive back then.)

Thanks,
Pedro Alves
