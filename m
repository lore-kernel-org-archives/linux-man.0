From: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH] Fix readdir_r with long file names
Date: Tue, 1 Mar 2016 17:59:37 +0100
Message-ID: <56D5CA79.9030204@redhat.com>
References: <51B0B39F.4060202@redhat.com> <51B0BD36.3030202@redhat.com>
 <CAHGf_=r9Rz63pho+84ORk0a_oDyJSj-MCnZ56uPrT3L6sVEfeQ@mail.gmail.com>
 <20130607013024.GO29800@brightrain.aerifal.cx> <51B19203.3070307@redhat.com>
 <20130607144143.GQ29800@brightrain.aerifal.cx> <51B57E35.4080403@redhat.com>
 <51B65EA7.2020402@redhat.com> <20130611011324.GT29800@brightrain.aerifal.cx>
 <51B8702D.2060505@redhat.com>
 <20130813040038.GE21795@spoyarek.pnq.redhat.com>
 <520C88A6.9070501@redhat.com> <56D54DAD.1040306@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-67733-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <56D54DAD.1040306@gmail.com>
To: mtk.manpages@gmail.com, Siddhesh Poyarekar <siddhesh@redhat.com>
Cc: Rich Felker <dalias@aerifal.cx>, Carlos O'Donell <carlos@redhat.com>, KOSAKI Motohiro <kosaki.motohiro@gmail.com>, libc-alpha <libc-alpha@sourceware.org>, Roland McGrath <roland@hack.frob.com>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On 03/01/2016 09:07 AM, Michael Kerrisk (man-pages) wrote:

> I see that glibc 2.23 deprecates readdir_r(), which prompted me to catch
> up on this thread. I'd like to see the points you make documented in the
> readdir_r(3) man page also. Would you be willing to allow that text to
> be reused / reworked for the page, under that page's existing "verbatim"
> license (https://www.kernel.org/doc/man-pages/licenses.html#verbatim)?

Hi Michael,

thanks for keeping an eye on deprecations.  The deprecation happened for
glibc 2.24 (unrelased).

I'm happy to report that I may grant your request.

> The text I'd propose to add to the man page would be (new material
> starting at ===>):

It may make sense to move this documentation to a separate manual page,
specific to readdir_r.  This will keep the readdir documentation nice
and crisp.  Most programmers will never have to consult all these details.

You should remove the example using pathconf because it is not correct.
 The kernel does not return valid values for _PC_NAME_MAX and some file
systems (such as CIFS, and CD-ROMs with Joliet extensions once a kernel
bug is fixed).  The CIFS limit is somewhere around 765, and not 255 as
reported by the kernel.  If I recall correctly, Windows SMB servers can
actually exceed the 255 byte limit.  The reason is that Windows NTFS has
a limit based on 16-bit UCS-2 characters, and after UTF-8 conversion,
the maximum length is more than 255 bytes.

> ===>   However, the above approach has problems, and it is recommended
>        that  applications  use readdir() instead of readdir_r().  Fur‐
>        thermore, since version  2.23,  glibc  deprecates  readdir_r().
>        The reasons are as follows:
> 
>        *  On  systems where NAME_MAX is undefined, calling readdir_r()
>           may be unsafe because the interface does not allow the call‐
>           er to specify the length of the buffer used for the returned
>           directory entry.
> 
>        *  On some systems, readdir_r() can't  read  directory  entries
>           with very long names.  When the glibc implementation encoun‐
>           ters such a name, readdir_r() fails with the error ENAMETOO‐
>           LONG after the final directory entry has been read.  On some
>           other systems, readdir_r() may return a success status,  but
>           the  returned d_name field may not be null terminated or may
>           be truncated.
> 
>        *  In the current POSIX.1 specification  (POSIX.1-2008),  read‐
>           dir_r() is not required to be thread-safe.  However, in mod‐
>           ern implementations (including  the  glibc  implementation),
>           concurrent  calls  to  readdir_r()  that  specify  different
>           directory streams are thread-safe.  Therefore,  the  use  of

These two references to readdir_r should be to readdir instead.

I believe there was a historic implementation which implemented
fdopendir (fd) as (DIR *) fd, and used a global static buffer for
readdir.  This is about the only way readdir can be non-thread-safe.

>           readdir_r()  is  generally unnecessary in multithreaded pro‐
>           grams.  In cases where multiple threads must read  from  the
>           same  directory  stream,  using readdir() with external syn‐
>           chronization is still preferable to the use of  readdir_r(),
>           for the reasons given in the points above.
> 
>        *  It  is  expected  that a future version of POSIX.1 will make
>           readdir_r() obsolete, and require that readdir() be  thread-
>           safe  when  concurrently  employed  on  different  directory
>           streams.

Okay.

Thanks,
Florian
