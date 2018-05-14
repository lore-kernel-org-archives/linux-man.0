From: Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: [bpf-next PATCH 5/5] bpf, doc: howto use/run the BPF selftests
Date: Mon, 14 May 2018 18:05:14 +0200
Message-ID: <20180514180514.4fd0ba66@redhat.com>
References: <152630528901.29210.9018565600000101307.stgit@firesoul>
        <152630535224.29210.11623921130132517306.stgit@firesoul>
        <CAKvUva-_EbMez7c=CHXUPcGKmU=jGne5ZVu4CXwR8szrNUhRhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAKvUva-_EbMez7c=CHXUPcGKmU=jGne5ZVu4CXwR8szrNUhRhw@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Silvan Jegen <s.jegen@gmail.com>
Cc: borkmann@iogearbox.net, alexei.starovoitov@gmail.com, netdev@vger.kernel.org, quentin.monnet@netronome.com, linux-man <linux-man@vger.kernel.org>, linux-doc@vger.kernel.org, brouer@redhat.com
List-Id: linux-man@vger.kernel.org

On Mon, 14 May 2018 17:15:54 +0200
Silvan Jegen <s.jegen@gmail.com> wrote:

> Hi
> 
> Some typo fixes below.
> 
> On Mon, May 14, 2018 at 3:43 PM Jesper Dangaard Brouer <brouer@redhat.com>
> wrote:
> > I always forget howto run the BPF selftests. Thus, lets add that info
> > to the QA document.  
> 
> > Documentation was based on Cilium's documentation:
> >   http://cilium.readthedocs.io/en/latest/bpf/#verifying-the-setup  
> 
> > Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
> > ---
> >   Documentation/bpf/bpf_devel_QA.rst |   29 +++++++++++++++++++++++++++++
> >   1 file changed, 29 insertions(+)  
> 
> > diff --git a/Documentation/bpf/bpf_devel_QA.rst  
> b/Documentation/bpf/bpf_devel_QA.rst
> > index 2254bdeae990..0e7c1d946e83 100644
> > --- a/Documentation/bpf/bpf_devel_QA.rst
> > +++ b/Documentation/bpf/bpf_devel_QA.rst
> > @@ -417,6 +417,33 @@ submitted by the BPF maintainers to the stable  
> maintainers.
> >   Testing patches
> >   ===============  
> 
> > +Q: How to run BPF selftests
> > +---------------------------
> > +A: After you have booted into the newly compiled kernel, navigate to
> > +the BPF selftests_ suite in order to test BPF functionality (current
> > +working directory points to the root of the cloned git tree)::
> > +
> > +  $ cd tools/testing/selftests/bpf/
> > +  $ make
> > +
> > +To run the verifier tests::
> > +
> > +  $ sudo ./test_verifier
> > +
> > +The verifier tests print out all the current checks being
> > +performed. The summary at the end of running all tests will dump
> > +information of test successes and failures::  
> 
> Two colons at the end of the line. Don't think that was intended.

It is intended, that is part of the RST formatting.

> 
> > +
> > +  Summary: 418 PASSED, 0 FAILED
> > +
> > +In order to run through all BPF selftests, the following command is
> > +needed::
> > +
> > +  $ sudo make run_tests
> > +
> > +See the kernels selftest `Documentation/dev-tools/kselftest.rst`_  
> 
> s/kernels/kernel's/

I guess that is more correct...

> I also think the underscore at the end of this line is misplaced (or it
> should be a dash instead).

This is also part of the RST formatting.  This is a link. 


> > +document for further documentation.
> > +
> >   Q: Which BPF kernel selftests version should I run my kernel against?
> >   ---------------------------------------------------------------------
> >   A: If you run a kernel ``xyz``, then always run the BPF kernel selftests
> > @@ -607,5 +634,7 @@ when:
> >   .. _netdev FAQ: ../networking/netdev-FAQ.txt
> >   .. _samples/bpf/: ../../samples/bpf/
> >   .. _selftests: ../../tools/testing/selftests/bpf/
> > +.. _Documentation/dev-tools/kselftest.rst:
> > +   https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html  

The link is defined above/here.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
