From: Quentin Monnet <quentin.monnet@netronome.com>
Subject: [RFC bpf-next v2 0/8] bpf: document eBPF helpers and add a script to generate man page
Date: Tue, 10 Apr 2018 15:41:49 +0100
Message-ID: <20180410144157.4831-1-quentin.monnet@netronome.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: daniel@iogearbox.net, ast@kernel.org
Cc: netdev@vger.kernel.org, oss-drivers@netronome.com, quentin.monnet@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

eBPF helper functions can be called from within eBPF programs to perform
a variety of tasks that would be otherwise hard or impossible to do with
eBPF itself. There is a growing number of such helper functions in the
kernel, but documentation is scarce. The main user space header file
does contain a short commented description of most helpers, but it is
somewhat outdated and not complete. It is more a "cheat sheet" than a
real documentation accessible to new eBPF developers.

This commit attempts to improve the situation by replacing the existing
overview for the helpers with a more developed description. Furthermore,
a Python script is added to generate a manual page for eBPF helpers. The
workflow is the following, and requires the rst2man utility:

    $ ./scripts/bpf_helpers_doc.py \
            --filename include/uapi/linux/bpf.h > /tmp/bpf-helpers.rst
    $ rst2man /tmp/bpf-helpers.rst > /tmp/bpf-helpers.7
    $ man /tmp/bpf-helpers.7

The objective is to keep all documentation related to the helpers in a
single place, and to be able to generate from here a manual page that
could be packaged in the man-pages repository and shipped with most
distributions.

Additionally, parsing the prototypes of the helper functions could
hopefully be reused, with a different Printer object, to generate
header files needed in some eBPF-related projects.

Regarding the description of each helper, it comprises several items:

- The function prototype.
- A description of the function and of its arguments (except for a
  couple of cases, when there are no arguments and the return value
  makes the function usage really obvious).
- A description of return values (if not void).

Additional items such as the list of compatible eBPF program and map
types for each helper, Linux kernel version that introduced the helper,
GPL-only restriction, and commit hash could be added in the future, but
it was decided on the mailing list to leave them aside for now.

For several helpers, descriptions are inspired (at times, nearly copied)
from the commit logs introducing them in the kernel--Many thanks to
their respective authors! They were completed as much as possible, the
objective being to have something easily accessible even for people just
starting with eBPF. There is probably a bit more work to do in this
direction for some helpers.

Some RST formatting is used in the descriptions (not in function
prototypes, to keep them readable, but the Python script provided in
order to generate the RST for the manual page does add formatting to
prototypes, to produce something pretty) to get "bold" and "italics" in
manual pages. Hopefully, the descriptions in bpf.h file remains
perfectly readable. Note that the few trailing white spaces are
intentional, removing them would break paragraphs for rst2man.

The descriptions should ideally be updated each time someone adds a new
helper, or updates the behaviour (new socket option supported, ...) or
the interface (new flags available, ...) of existing ones.

The second RFC for this set splits the documentation into several patches.
Ideally all helper descriptions should be reviewed by the respective
authors of the functions they describe. Please do not hesitate to suggest
improvements to make descriptions more complete or accessible.

v2:
- Remove "For" (compatible program and map types), "Since" (minimal
  Linux kernel version required), "GPL only" sections and commit hashes
  for the helpers.
- Add comment on top of the description list to explain how this
  documentation is supposed to be processed.
- Update Python script accordingly (remove the same sections, and remove
  paragraphs on program types and GPL restrictions from man page
  header).
- Split series into several patches.

Cc: linux-doc@vger.kernel.org
Cc: linux-man@vger.kernel.org
Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>

Quentin Monnet (8):
  bpf: add script and prepare bpf.h for new helpers documentation
  bpf: add documentation for eBPF helpers (01-11)
  bpf: add documentation for eBPF helpers (12-22)
  bpf: add documentation for eBPF helpers (23-32)
  bpf: add documentation for eBPF helpers (33-41)
  bpf: add documentation for eBPF helpers (42-50)
  bpf: add documentation for eBPF helpers (51-57)
  bpf: add documentation for eBPF helpers (58-64)

 include/uapi/linux/bpf.h   | 1580 +++++++++++++++++++++++++++++++++-----------
 scripts/bpf_helpers_doc.py |  414 ++++++++++++
 2 files changed, 1616 insertions(+), 378 deletions(-)
 create mode 100755 scripts/bpf_helpers_doc.py

-- 
2.14.1
