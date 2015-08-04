From: Roland McGrath <roland@hack.frob.com>
Subject: Re: For review: nptl(7) man page
Date: Tue,  4 Aug 2015 08:06:48 -0700 (PDT)
Message-ID: <20150804150648.9E9F42C3B01@topped-with-meat.com>
References: <550ED3F4.1080403@gmail.com>
	<550F363B.801@gmail.com>
	<55B1EFFA.9070608@gmail.com>
	<CAODz2cDq4o85NOzqCDg9cH8eCvqt3Tq5QXKMMJtXbik5h5bL+Q@mail.gmail.com>
	<55B54215.6070502@gmail.com>
	<1438616740.20974.81.camel@localhost.localdomain>
	<20150803200825.GJ16376@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-61609-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: Rich Felker's message of  Monday, 3 August 2015 16:08:25 -0400 <20150803200825.GJ16376@brightrain.aerifal.cx>
To: Rich Felker <dalias@libc.org>
Cc: Torvald Riegel <triegel@redhat.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Nicholas Miell <nmiell@gmail.com>, linux-man@vger.kernel.org, libc-alpha@sourceware.org, Carlos O'Donell <carlos@redhat.com>
List-Id: linux-man@vger.kernel.org

> It doesn't directly. If you consider the models as two separate
> "compilation environments"/"execution environments" of the same
> implementation, then it would at least be within the scope of POSIX to
> have something to say about it. 

I think we are asserting that they are exactly that by dint of the confstr
results for _CS_POSIX_V7_ILP32_OFF32_CFLAGS et al.  So the question is what
POSIX actually does or doesn't say about process-shared synchronization
objects being shared between processes running programs built in different
POSIX compilation environments.

The other relevant question is whether 32/64 sharing of each particular
pshared object has in fact worked reliably under glibc in the past.  Since
we haven't been clear and explicit about the subject before AFAIK, then if
in fact it worked before then people might well have inferred that we made
such an ABI guarantee.  (I hope not, since if so we just broke it.)
