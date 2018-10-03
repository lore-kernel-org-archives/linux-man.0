From: Jann Horn <jannh@google.com>
Subject: BPF: RCU use-after-reallocation of hash table elements?
Date: Wed, 3 Oct 2018 18:15:08 +0200
Message-ID: <CAG48ez0Q3BaFsA_FUs1ZCAMRZtXkq5o_VCbU8CgTEVwa2HRZfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Network Development <netdev@vger.kernel.org>, kernel list <linux-kernel@vger.kernel.org>, Michael Kerrisk-manpages <mtk.manpages@gmail.com>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Hi!

Note: I haven't tested any of this; feel free to tell me that I've
completely misunderstood how all this works.

The BPF manpage, at the moment, states about BPF hash tables:

       BPF_MAP_TYPE_HASH
              Hash-table maps have the following characteristics:

              *  Maps are created and destroyed by user-space programs.
                 Both user-space and eBPF programs can perform lookup,
                 update, and delete operations.

              *  The kernel takes care of allocating and freeing key/value
                 pairs.

              *  The map_update_elem() helper will fail to insert new ele=
=E2=80=90
                 ment when the max_entries limit is reached.  (This ensures
                 that eBPF programs cannot exhaust memory.)

              *  map_update_elem() replaces existing elements atomically.

              Hash-table maps are optimized for speed of lookup.

This documentation claims that elements are replaced "atomically", and
that the kernel "takes care of allocating and freeing key/value
pairs". But as far as I can tell, that's not quite the whole story
least since commit 6c90598174322b8888029e40dd84a4eb01f56afe (first in
4.6).

Unless a BPF hash table is created with the (undocumented) flag
BPF_F_NO_PREALLOC, the kernel now actually pre-allocates the hash
table elements. Hash table elements can be freed and reused for new
allocations (!) without waiting for an RCU grace period: Freed
elements are immediately pushed on the percpu freelist, and can be
immediately reused from there. The most obvious consequence of this is
that if a BPF program looks up a hash table entry and then reads the
value, the value can be replaced with a new value in between. A more
subtle consequence is that BPF map lookups can return false-positive
results: If the first half of the lookup key matches the old key, and
the second half of the lookup key matches the new key, then a BPF map
lookup can return a false-positive result, as far as I can tell.

If what I'm saying is correct, I'm not sure what the best fix is.

Add a grace period when freeing hash map entries, and add a new -EBUSY
return value for attempts to create hash map entries when all free
entries are waiting for the end of an RCU grace period?

Add a grace period when freeing hash map entries, and use
rcu_synchronize() when inserting BPF hashmap entries from userspace
and all free entries are waiting for RCU? But that still leaves the
bpf_map_update_elem_proto helper that can be called from BPF.
Deprecate that helper for access to hash maps?

Document the race, and advise people who use BPF for
non-performance-tracing purposes (where occasional false positives
actually matter) to use BPF_F_NO_PREALLOC?

Add some sort of sequence lock to BPF (yuck)?
