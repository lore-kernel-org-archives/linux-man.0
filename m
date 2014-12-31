From: Alexandre Oliva <aoliva@redhat.com>
Subject: Re: Adding reentrancy information to safety notes?
Date: Wed, 31 Dec 2014 07:38:20 -0200
Message-ID: <orppb0dur7.fsf@livre.home>
References: <54A2C8A6.9050100@redhat.com> <ork318eoj4.fsf@livre.home>
	<20141230230529.GT4574@brightrain.aerifal.cx>
	<orfvbwegqg.fsf@livre.home> <54A377B8.60802@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <libc-alpha-return-55928-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <54A377B8.60802@redhat.com> (Carlos O'Donell's message of "Tue,
	30 Dec 2014 23:12:40 -0500")
To: Carlos O'Donell <carlos@redhat.com>
Cc: Rich Felker <dalias@libc.org>, Michael Kerrisk <mtk.manpages@gmail.com>, Peng Haitao <penght@cn.fujitsu.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On Dec 31, 2014, "Carlos O'Donell" <carlos@redhat.com> wrote:

> That is not the definition of reentrancy that I had in mind.

Since reentrant is such an overloaded term, how about using the term
Recursion-Safe, that AFAICT covers only the concept you have in mind.
Another possible term that occurs to me is Synchronously Reentrant, to
indicate it doesn't cover asynchronous reentrancy out of signals or
multiple threads.  We could then shorten it as SR-Safe.

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
