From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sync man page in coreutils and man-pages
Date: Mon, 10 Mar 2014 15:25:59 +0100
Message-ID: <CAKgNAkjYYjoFqVX7g3kzshCctQ=w8MM_t732zMr81+VXsQ_sOA@mail.gmail.com>
References: <531DAA1D.6060705@gmail.com> <20140310121010.GA31927@infradead.org>
	<531DB150.5090301@draigBrady.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <coreutils-bounces+gcgcg-coreutils=m.gmane.org-mXXj517/zsQ@public.gmane.org>
In-Reply-To: <531DB150.5090301-V8g9lnOeT5ydJdNcDFJN0w@public.gmane.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/coreutils>,
	<mailto:coreutils-request-mXXj517/zsQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/coreutils>
List-Post: <mailto:coreutils-mXXj517/zsQ@public.gmane.org>
List-Help: <mailto:coreutils-request-mXXj517/zsQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/coreutils>,
	<mailto:coreutils-request-mXXj517/zsQ@public.gmane.org?subject=subscribe>
Errors-To: coreutils-bounces+gcgcg-coreutils=m.gmane.org-mXXj517/zsQ@public.gmane.org
Sender: coreutils-bounces+gcgcg-coreutils=m.gmane.org-mXXj517/zsQ@public.gmane.org
To: =?ISO-8859-1?Q?P=E1draig_Brady?= <P@draigbrady.com>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, coreutils-mXXj517/zsQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Mar 10, 2014 at 1:34 PM, P=E1draig Brady <P@draigbrady.com> wrote:
> On 03/10/2014 12:10 PM, Christoph Hellwig wrote:
>> On Mon, Mar 10, 2014 at 01:03:41PM +0100, Michael Kerrisk (man-pages) wr=
ote:
>>>        The  kernel  keeps  data  in  memory to avoid doing (relatively
>>>        slow) disk reads and writes.  This improves performance, but if
>>>        the  computer crashes, data may be lost or the file system cor??=
?
>>>        rupted as a result.  sync ensures that everything in memory  is
>>>        written to disk.
>>
>> This part looks correct.
>
> Yes, and it's already in the info pages:
> http://www.gnu.org/software/coreutils/manual/coreutils.html#sync-invocati=
on
>
> Generally we keep the man pages to a minimum,
> stating the interface and brief description.
> Users are prompted to run info coreutils 'sync invocation'
> for further discussion, where they'll see the above text.
>
>>
>>>        sync  should  be  called  before  the processor is halted in an
>>>        unusual manner (e.g., before causing a kernel panic when debug??=
?
>>>        ging  new  kernel  code).   In general, the processor should be
>>>        halted using the shutdown(8) or reboot(8) or halt(8)  commands,
>>>        which  will  attempt  to  put  the  system in a quiescent state
>>>        before calling sync(2).  (Various implementations of these com??=
?
>>>        mands  exist;  consult  your documentation; on some systems one
>>>        should not call reboot(8) and halt(8) directly.)
>>
>> This kind of information does not seem useful for a user of a command
>> line utility, and the last bit seems incorrect at least for Linux.
>
> I agree.

Right then. The man-pages project just shrank by one page.

Thanks for your input, P=E1draig.

Cheers,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
