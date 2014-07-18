From: ams@gnu.org (Alfred M. Szmidt)
Subject: Re: For review: memusage(1) man page
Date: Fri, 18 Jul 2014 05:20:03 -0400
Message-ID: <E1X84Kh-00041J-2z@fencepost.gnu.org>
References: <53C8E244.2080901@redhat.com>
Reply-To: ams@gnu.org
Return-path: <libc-alpha-return-51828-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-reply-to: <53C8E244.2080901@redhat.com> (message from Jan Chaloupka on Fri,
	18 Jul 2014 11:00:52 +0200)
To: Jan Chaloupka <jchaloup@redhat.com>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, libc-alpha@sourceware.org, myllynen@redhat.com, drepper@gmail.com, pschiffe@redhat.com
List-Id: linux-man@vger.kernel.org

   memusage command is no documented. My collegue (95%) and I (5%)
   have written a man page for it. All informations come from
   inspecting the script code. This is the first script, others are
   memusagestat (1) and mtrace(1).

This, memusagestat, and mtrace should rather be put into the glibc
manual.  mtrace is already (though partially) documented there, and
much of the details regarding the mtrace functions.  Having the
corresponding commands documented would be awesome though.
