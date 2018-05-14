From: Jesper Dangaard Brouer <brouer@redhat.com>
Subject: [bpf-next PATCH 5/5] bpf, doc: howto use/run the BPF selftests
Date: Mon, 14 May 2018 15:42:32 +0200
Message-ID: <152630535224.29210.11623921130132517306.stgit@firesoul>
References: <152630528901.29210.9018565600000101307.stgit@firesoul>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <152630528901.29210.9018565600000101307.stgit@firesoul>
Sender: netdev-owner@vger.kernel.org
To: Daniel Borkmann <borkmann@iogearbox.net>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Jesper Dangaard Brouer <brouer@redhat.com>
Cc: netdev@vger.kernel.org, Quentin Monnet <quentin.monnet@netronome.com>, linux-man@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-man@vger.kernel.org

I always forget howto run the BPF selftests. Thus, lets add that info
to the QA document.

Documentation was based on Cilium's documentation:
 http://cilium.readthedocs.io/en/latest/bpf/#verifying-the-setup

Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
---
 Documentation/bpf/bpf_devel_QA.rst |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/bpf/bpf_devel_QA.rst b/Documentation/bpf/bpf_devel_QA.rst
index 2254bdeae990..0e7c1d946e83 100644
--- a/Documentation/bpf/bpf_devel_QA.rst
+++ b/Documentation/bpf/bpf_devel_QA.rst
@@ -417,6 +417,33 @@ submitted by the BPF maintainers to the stable maintainers.
 Testing patches
 ===============
 
+Q: How to run BPF selftests
+---------------------------
+A: After you have booted into the newly compiled kernel, navigate to
+the BPF selftests_ suite in order to test BPF functionality (current
+working directory points to the root of the cloned git tree)::
+
+  $ cd tools/testing/selftests/bpf/
+  $ make
+
+To run the verifier tests::
+
+  $ sudo ./test_verifier
+
+The verifier tests print out all the current checks being
+performed. The summary at the end of running all tests will dump
+information of test successes and failures::
+
+  Summary: 418 PASSED, 0 FAILED
+
+In order to run through all BPF selftests, the following command is
+needed::
+
+  $ sudo make run_tests
+
+See the kernels selftest `Documentation/dev-tools/kselftest.rst`_
+document for further documentation.
+
 Q: Which BPF kernel selftests version should I run my kernel against?
 ---------------------------------------------------------------------
 A: If you run a kernel ``xyz``, then always run the BPF kernel selftests
@@ -607,5 +634,7 @@ when:
 .. _netdev FAQ: ../networking/netdev-FAQ.txt
 .. _samples/bpf/: ../../samples/bpf/
 .. _selftests: ../../tools/testing/selftests/bpf/
+.. _Documentation/dev-tools/kselftest.rst:
+   https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html
 
 Happy BPF hacking!
