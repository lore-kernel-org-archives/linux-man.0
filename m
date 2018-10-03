From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: BPF: RCU use-after-reallocation of hash table elements?
Date: Wed, 3 Oct 2018 10:05:22 -0700
Message-ID: <20181003170520.gc43zeffylshz5k2@ast-mbp.dhcp.thefacebook.com>
References: <CAG48ez0Q3BaFsA_FUs1ZCAMRZtXkq5o_VCbU8CgTEVwa2HRZfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAG48ez0Q3BaFsA_FUs1ZCAMRZtXkq5o_VCbU8CgTEVwa2HRZfQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jann Horn <jannh@google.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Network Development <netdev@vger.kernel.org>, kernel list <linux-kernel@vger.kernel.org>, Michael Kerrisk-manpages <mtk.manpages@gmail.com>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Wed, Oct 03, 2018 at 06:15:08PM +0200, Jann Horn wrote:
> Hi!
> 
> Note: I haven't tested any of this; feel free to tell me that I've
> completely misunderstood how all this works.
> 
> The BPF manpage, at the moment, states about BPF hash tables:

unfortunately man pages have been obsolete for long time.
the only doc that is mostly up to date is
http://docs.cilium.io/en/latest/bpf/

> Unless a BPF hash table is created with the (undocumented) flag
> BPF_F_NO_PREALLOC, the kernel now actually pre-allocates the hash
> table elements. Hash table elements can be freed and reused for new
> allocations (!) without waiting for an RCU grace period: Freed
> elements are immediately pushed on the percpu freelist, and can be
> immediately reused from there. The most obvious consequence of this is
> that if a BPF program looks up a hash table entry and then reads the
> value, the value can be replaced with a new value in between. A more
> subtle consequence is that BPF map lookups can return false-positive
> results: If the first half of the lookup key matches the old key, and
> the second half of the lookup key matches the new key, then a BPF map
> lookup can return a false-positive result, as far as I can tell.

Correct. That is the case when one cpu deletes the pre-allocated element
and immediately reuses the slot in update_elem while another cpu is still
looking into it.

> If what I'm saying is correct, I'm not sure what the best fix is.
>
> Add a grace period when freeing hash map entries, and add a new -EBUSY
> return value for attempts to create hash map entries when all free
> entries are waiting for the end of an RCU grace period?
> 
> Add a grace period when freeing hash map entries, and use
> rcu_synchronize() when inserting BPF hashmap entries from userspace
> and all free entries are waiting for RCU? But that still leaves the
> bpf_map_update_elem_proto helper that can be called from BPF.
> Deprecate that helper for access to hash maps?
> 
> Document the race, and advise people who use BPF for
> non-performance-tracing purposes (where occasional false positives
> actually matter) to use BPF_F_NO_PREALLOC?

Definitely our fault that it's not documented clearly.
There are subtle issues with kmalloc style as well.
See free_htab_elem():
  atomic_dec(&htab->count);
  l->htab = htab;
  call_rcu(&l->rcu, htab_elem_free_rcu);
which means that for short time the total memory
consumption of the no_prealloc hash map can be higher
than max_entries limit while rcu callbacks are working their way through.
For bpf prog that is invoked million times a second and constantly
doing delete/update the rcu callback latency can be an issue.
Hence the use of no_prealloc needs to be carefully considered as well.

we tried to atomic_dec in rcu callback, but that caused even more
issues, since already written bpf progs expected max_entries limit
to be accurate.

> Add some sort of sequence lock to BPF (yuck)?

why yuck reaction? ;)
Locks are mandatory primitives in concurrent programming and
the lock support is coming to bpf as well.
bpf progs themselves will be able to do lock/unlock of objects
to maintain atomicity of multi field updates.
Right now updating two counters atomically is pretty much impossible.
hash map update can replace the element with a copy, but that's not
usable for counters.
Soon the program will be able to do:
struct value_t {
  u32 var1, var2;
  bpf_lock_t lock;
};
struct value_t * value = bpf_map_lookup_elem(map, &key);
bpf_lock(&value->lock);
value->var1++;
value->var2++;
bpf_unlock(&value->lock);
and verifier will be smart enough to make sure locks don't escape.

Also alloc/free will be available to bpf progs and new program
types won't have to run as one giant rcu_lock+preempt_disable section.
Progs will be able to do rcu_lock/unlock and preempt_enable/disable
from inside the program.
