From: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH] Fix readdir_r with long file names
Date: Thu, 10 Mar 2016 12:22:28 +0100
Message-ID: <56E158F4.6040506@redhat.com>
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
 <56D614AA.7020500@redhat.com> <56D61A86.3050108@cs.ucla.edu>
 <56D620AA.40108@redhat.com> <56D624FE.1090702@cs.ucla.edu>
 <56D6294A.5040703@redhat.com> <56D6C2CA.2020609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-68019-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <56D6C2CA.2020609@gmail.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Paul Eggert <eggert@cs.ucla.edu>, Siddhesh Poyarekar <siddhesh@redhat.com>
Cc: Rich Felker <dalias@aerifal.cx>, Carlos O'Donell <carlos@redhat.com>, KOSAKI Motohiro <kosaki.motohiro@gmail.com>, libc-alpha <libc-alpha@sourceware.org>, Roland McGrath <roland@hack.frob.com>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On 03/02/2016 11:39 AM, Michael Kerrisk (man-pages) wrote:
>        of the dname field.  POSIX defines it as char d_name[], a char‐

Should be “d_name” instead of “dname”.

Otherwise looks fine.

Thanks,
Florian
