From: Silvan Jegen <s.jegen@gmail.com>
Subject: Re: [bpf-next PATCH 5/5] bpf, doc: howto use/run the BPF selftests
Date: Mon, 14 May 2018 20:46:17 +0200
Message-ID: <20180514184617.GA1723@homearch.localdomain>
References: <152630528901.29210.9018565600000101307.stgit@firesoul>
 <152630535224.29210.11623921130132517306.stgit@firesoul>
 <CAKvUva-_EbMez7c=CHXUPcGKmU=jGne5ZVu4CXwR8szrNUhRhw@mail.gmail.com>
 <20180514180514.4fd0ba66@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180514180514.4fd0ba66@redhat.com>
Sender: netdev-owner@vger.kernel.org
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: borkmann@iogearbox.net, alexei.starovoitov@gmail.com, netdev@vger.kernel.org, quentin.monnet@netronome.com, linux-man <linux-man@vger.kernel.org>, linux-doc@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Mon, May 14, 2018 at 06:05:14PM +0200, Jesper Dangaard Brouer wrote:
> On Mon, 14 May 2018 17:15:54 +0200
> Silvan Jegen <s.jegen@gmail.com> wrote:
> 
> > Hi
> > 
> > Some typo fixes below.
> > 
> > On Mon, May 14, 2018 at 3:43 PM Jesper Dangaard Brouer <brouer@redhat.com>
> > wrote:
> > > I always forget howto run the BPF selftests. Thus, lets add that info
> > > to the QA document.  
> >
> > [...] 
> >
> > I also think the underscore at the end of this line is misplaced (or it
> > should be a dash instead).
> 
> This is also part of the RST formatting.  This is a link. 
> 
> 
> > > +document for further documentation.
> > > +
> > >   Q: Which BPF kernel selftests version should I run my kernel against?
> > >   ---------------------------------------------------------------------
> > >   A: If you run a kernel ``xyz``, then always run the BPF kernel selftests
> > > @@ -607,5 +634,7 @@ when:
> > >   .. _netdev FAQ: ../networking/netdev-FAQ.txt
> > >   .. _samples/bpf/: ../../samples/bpf/
> > >   .. _selftests: ../../tools/testing/selftests/bpf/
> > > +.. _Documentation/dev-tools/kselftest.rst:
> > > +   https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html  
> 
> The link is defined above/here.

Ah, thanks I didn't know.


Cheers,

Silvan

 
> -- 
> Best regards,
>   Jesper Dangaard Brouer
>   MSc.CS, Principal Kernel Engineer at Red Hat
>   LinkedIn: http://www.linkedin.com/in/brouer
