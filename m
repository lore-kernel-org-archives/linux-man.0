From: Paul Eggert <eggert@cs.ucla.edu>
Subject: Re: [PATCH] Fix readdir_r with long file names
Date: Tue, 1 Mar 2016 14:41:10 -0800
Message-ID: <56D61A86.3050108@cs.ucla.edu>
References: <51B0B39F.4060202@redhat.com> <51B0BD36.3030202@redhat.com>
 <CAHGf_=r9Rz63pho+84ORk0a_oDyJSj-MCnZ56uPrT3L6sVEfeQ@mail.gmail.com>
 <20130607013024.GO29800@brightrain.aerifal.cx> <51B19203.3070307@redhat.com>
 <20130607144143.GQ29800@brightrain.aerifal.cx> <51B57E35.4080403@redhat.com>
 <51B65EA7.2020402@redhat.com> <20130611011324.GT29800@brightrain.aerifal.cx>
 <51B8702D.2060505@redhat.com>
 <20130813040038.GE21795@spoyarek.pnq.redhat.com>
 <520C88A6.9070501@redhat.com> <56D54DAD.1040306@gmail.com>
 <56D5CA79.9030204@redhat.com> <56D5F832.3070209@gmail.com>
 <56D5FB3D.5000306@redhat.com> <56D607BB.6080701@cs.ucla.edu>
 <56D614AA.7020500@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040905010705010105050909"
Return-path: <libc-alpha-return-67750-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <56D614AA.7020500@redhat.com>
To: Florian Weimer <fweimer@redhat.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Siddhesh Poyarekar <siddhesh@redhat.com>
Cc: Rich Felker <dalias@aerifal.cx>, Carlos O'Donell <carlos@redhat.com>, KOSAKI Motohiro <kosaki.motohiro@gmail.com>, libc-alpha <libc-alpha@sourceware.org>, Roland McGrath <roland@hack.frob.com>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------040905010705010105050909
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2016 02:16 PM, Florian Weimer wrote:
>> Why not use a flexible array member for this?
> For which part, and how exactly?

Something like the attached patch, say.  (Totally untested.)

> You can't put a flexible array member into a transparent union.

That's OK. Any such usage of struct dirent would be unportable anyway.

> If you mean to add some zero-width padding member at the end of the
> struct, after the d_name member, then I'm worried that makes overrunning
> the d_name array member even more undefined than it already is.

No, no padding member, just use C99 the way it was designed.  This 
should improve overrun detection in programs like valgrind. With glibc's 
current definition these programs can be fooled into thinking that 
struct dirent accesses are invalid (outside of array bounds) when they 
are actually OK, so people shut off array-bounds checking. If we used 
flexible array members, valgrind etc. should know that the array's upper 
bound is unknown and should not issue so many false alarms, so people 
can leave bounds checking on.

Also, I expect this sort of thing will become more important as GCC 
-fbounds-check becomes more practical.

If flexible arrays are no-go for some reason, I suppose we could use 
'char 'd_name[SIZE_MAX - 1000];' instead. That should get peoples' 
attention. :-)

--------------040905010705010105050909
Content-Type: text/x-patch;
 name="d_name.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="d_name.diff"

diff --git a/bits/dirent.h b/bits/dirent.h
index 7b79a53..8546c29 100644
--- a/bits/dirent.h
+++ b/bits/dirent.h
@@ -32,7 +32,7 @@ struct dirent
     unsigned char d_namlen;	/* Length of the file name.  */
 
     /* Only this member is in the POSIX standard.  */
-    char d_name[1];		/* File name (actually longer).  */
+    char d_name __flexarr;	/* File name.  */
   };
 
 #ifdef __USE_LARGEFILE64
@@ -42,8 +42,7 @@ struct dirent64
     unsigned short int d_reclen;
     unsigned char d_type;
     unsigned char d_namlen;
-
-    char d_name[1];
+    char d_name __flexarr;	/* File name.  */
   };
 #endif
 

--------------040905010705010105050909--
