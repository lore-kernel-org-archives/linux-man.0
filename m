From: Jan Chaloupka <jchaloup@redhat.com>
Subject: Re: For review: memusage(1) man page
Date: Fri, 18 Jul 2014 11:50:54 +0200
Message-ID: <53C8EDFE.5000908@redhat.com>
References: <53C8E244.2080901@redhat.com> <E1X84Kh-00041J-2z@fencepost.gnu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-51829-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <E1X84Kh-00041J-2z@fencepost.gnu.org>
To: ams@gnu.org
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, libc-alpha@sourceware.org, myllynen@redhat.com, drepper@gmail.com, pschiffe@redhat.com
List-Id: linux-man@vger.kernel.org


On 07/18/2014 11:20 AM, Alfred M. Szmidt wrote:
>     memusage command is no documented. My collegue (95%) and I (5%)
>     have written a man page for it. All informations come from
>     inspecting the script code. This is the first script, others are
>     memusagestat (1) and mtrace(1).
>
> This, memusagestat, and mtrace should rather be put into the glibc
> manual.
Having for example malloc in man pages, it is reasonable for me to put 
these three man pages here too. Searching manual for memusagestat help 
is time consuming. But yes, it should me in the manual too.
>    mtrace is already (though partially) documented there, and
> much of the details regarding the mtrace functions.  Having the
> corresponding commands documented would be awesome though.
