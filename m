From: Roland McGrath <roland@hack.frob.com>
Subject: Re: Race and segmentation fault in pthread_kill() vs thread
 teardown
Date: Wed,  2 Oct 2013 11:05:13 -0700 (PDT)
Message-ID: <20131002180513.78F4A2C078@topped-with-meat.com>
References: <305581948.26980.1380684877897.JavaMail.zimbra@efficios.com>
	<675415986.27031.1380686764309.JavaMail.zimbra@efficios.com>
	<mvm8uyc2itw.fsf@hawking.suse.de>
	<1497173819.27140.1380715480773.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-43303-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-##L=##H@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: Mathieu Desnoyers's message of  Wednesday, 2 October 2013 12:04:40 +0000 <1497173819.27140.1380715480773.JavaMail.zimbra@efficios.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andreas Schwab <schwab@suse.de>, Michael Kerrisk <mtk.manpages@gmail.com>, David Miller <davem@davemloft.net>, libc-alpha@sourceware.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Yes, the man page is wrong.  It was an error in the earlier version of the
spec that it indicated it's ever possible to do any operation with a
pthread_t that is not known to be an unjoined or live (if detached) thread.
It's never been possible to use a possibly-stale pthread_t for anything in
NPTL.  There is no way to interrogate the system for whether a pthread_t
value is valid--just like a pointer (which, in fact pthread_t is in our
implementation), either it's valid or using it is undefined behavior.
