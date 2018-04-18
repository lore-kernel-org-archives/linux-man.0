From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [PATCH bpf-next v3 5/8] bpf: add documentation for eBPF helpers
 (33-41)
Date: Wed, 18 Apr 2018 15:23:45 -0700
Message-ID: <20180418222344.7wzj3mkm6it5rdit@ast-mbp>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-6-quentin.monnet@netronome.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180417143438.7018-6-quentin.monnet@netronome.com>
Sender: netdev-owner@vger.kernel.org
To: Quentin Monnet <quentin.monnet@netronome.com>
Cc: daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Tue, Apr 17, 2018 at 03:34:35PM +0100, Quentin Monnet wrote:
> Add documentation for eBPF helper functions to bpf.h user header file.
> This documentation can be parsed with the Python script provided in
> another commit of the patch series, in order to provide a RST document
> that can later be converted into a man page.
> 
> The objective is to make the documentation easily understandable and
> accessible to all eBPF developers, including beginners.
> 
> This patch contains descriptions for the following helper functions, all
> written by Daniel:
> 
> - bpf_get_hash_recalc()
> - bpf_skb_change_tail()
> - bpf_skb_pull_data()
> - bpf_csum_update()
> - bpf_set_hash_invalid()
> - bpf_get_numa_node_id()
> - bpf_set_hash()
> - bpf_skb_adjust_room()
> - bpf_xdp_adjust_meta()
> 
> Cc: Daniel Borkmann <daniel@iogearbox.net>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>

Acked-by: Alexei Starovoitov <ast@kernel.org>
