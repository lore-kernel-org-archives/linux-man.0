From: Paul Eggert <eggert@cs.ucla.edu>
Subject: Re: [PATCH] Fix readdir_r with long file names
Date: Tue, 1 Mar 2016 13:20:59 -0800
Message-ID: <56D607BB.6080701@cs.ucla.edu>
References: <51B0B39F.4060202@redhat.com> <51B0BD36.3030202@redhat.com>
 <CAHGf_=r9Rz63pho+84ORk0a_oDyJSj-MCnZ56uPrT3L6sVEfeQ@mail.gmail.com>
 <20130607013024.GO29800@brightrain.aerifal.cx> <51B19203.3070307@redhat.com>
 <20130607144143.GQ29800@brightrain.aerifal.cx> <51B57E35.4080403@redhat.com>
 <51B65EA7.2020402@redhat.com> <20130611011324.GT29800@brightrain.aerifal.cx>
 <51B8702D.2060505@redhat.com>
 <20130813040038.GE21795@spoyarek.pnq.redhat.com>
 <520C88A6.9070501@redhat.com> <56D54DAD.1040306@gmail.com>
 <56D5CA79.9030204@redhat.com> <56D5F832.3070209@gmail.com>
 <56D5FB3D.5000306@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-67746-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <56D5FB3D.5000306@redhat.com>
To: Florian Weimer <fweimer@redhat.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Siddhesh Poyarekar <siddhesh@redhat.com>
Cc: Rich Felker <dalias@aerifal.cx>, Carlos O'Donell <carlos@redhat.com>, KOSAKI Motohiro <kosaki.motohiro@gmail.com>, libc-alpha <libc-alpha@sourceware.org>, Roland McGrath <roland@hack.frob.com>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On 03/01/2016 12:27 PM, Florian Weimer wrote:
> We
> should implement compiler support for this wart: inhibit optimizations
> (I think there are already special cases for length-0 and length-1
> arrays at the end, so it's not totally without precedent), and warn
> about sizeof (struct dirent) and using it as a (non-pointer) declarator.

Why not use a flexible array member for this? Sure, that assumes C99, 
but flexible array members are pretty much universally supported now 
(and we can fall back on the current layout for pre-C99 compilers). This 
would work better with modern compilers that treat small arrays with 
more respect than traditional C compilers did. And as I understand 
things, it would conform to POSIX (and if I'm wrong, POSIX should get 
fixed....).

For what it's worth, portable code cannot copy struct dirent values 
anyway, as this loses file names in operating systems like Solaris where 
d_name has size 1.
