Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF6733C518
	for <linux-man@vger.kernel.org>; Wed, 21 Jan 2026 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014604; cv=none; b=Ie8J+8zMd9Mv1ox4icNQmMfrcUNhbsn9JBbPioXbadBB+AiTpb07YoeUra8qZaZBJTGpRYx3jv5HW1s2I3nzUfi6lDdd8YW1aTnAXClMocNrDN8dTIF9iSJluqNHXukS5tZr71d2Lug5J7QJP3oVAbWal/SF9kchuEt59H1r4II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014604; c=relaxed/simple;
	bh=kHy3rjnjwYnRhMbWP44pB11HY7jknEVZEj3oXbHCbwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1u89Ckk4MlFm47Pkn6h0kg8hkvoIUp6okDtvKLcVf+qupa7wr2Tfptw6ho1ljpJ+9KsQMW6V1E7bEtxc2v/jxQilCQWqNnaTX1VWONwS6T5B0VWCWB9P92rZR6sM7P41E+Uvjib5L7DRUYWQrwSjKgh0yTIOxMcGJXf1p9u3r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 19D6472C8CC;
	Wed, 21 Jan 2026 19:56:40 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 0CE877CCB3A; Wed, 21 Jan 2026 18:56:40 +0200 (IST)
Date: Wed, 21 Jan 2026 18:56:39 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Marco Cavenati <Marco.Cavenati@eurecom.fr>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/ptrace.2: Add PTRACE_SET_SYSCALL_INFO, update
 struct ptrace_syscall_info
Message-ID: <20260121165639.GB6261@strace.io>
References: <20260121155550.281916-1-Marco.Cavenati@eurecom.fr>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260121155550.281916-1-Marco.Cavenati@eurecom.fr>

On Wed, Jan 21, 2026 at 04:55:41PM +0100, Marco Cavenati wrote:
> Add documentation for the new ptrace request PTRACE_SET_SYSCALL_INFO,
> introduced in Linux 6.16.
> 
> Add 'reserved' and 'flags' fields of struct ptrace_syscall_info.
> 
> This description is based on kernel commit 26bb32768fe6552de044f782a58b3272073fbfc0
> ("ptrace: introduce PTRACE_SET_SYSCALL_INFO request") by Dmitry V. Levin.
> 
> Signed-off-by: Marco Cavenati <Marco.Cavenati@eurecom.fr>
> ---
>  AUTHORS           |  1 +
>  man/man2/ptrace.2 | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/AUTHORS b/AUTHORS
> index 9035d405a..f332932e1 100644
> --- a/AUTHORS
> +++ b/AUTHORS
> @@ -497,6 +497,7 @@ Marc-André Lureau <marcandre.lureau@redhat.com>
>  Marcela Maslanova <mmaslano@redhat.com>
>  Marcin Ślusarz <marcin.slusarz@gmail.com>
>  Marco Bonelli <marco@mebeim.net>
> +Marco Cavenati <marco.cavenati@eurecom.fr>
>  Marcus Folkesson <marcus.folkesson@gmail.com>
>  Marcus Gelderie <redmnic@gmail.com>
>  Marcus Huewe <suse-tux@gmx.de>
> diff --git a/man/man2/ptrace.2 b/man/man2/ptrace.2
> index 2da43dcb9..45d4c4c84 100644
> --- a/man/man2/ptrace.2
> +++ b/man/man2/ptrace.2
> @@ -1042,6 +1042,8 @@ structure contains the following fields:
>  .EX
>  struct ptrace_syscall_info {
>      __u8 op;        /* Type of system call stop */
> +    __u8 reserved;  /* Reserved for future use, must be zero */
> +    __u16 flags;    /* Reserved for future use, must be zero */
>      __u32 arch;     /* AUDIT_ARCH_* value; see seccomp(2) */
>      __u64 instruction_pointer; /* CPU instruction pointer */
>      __u64 stack_pointer;    /* CPU stack pointer */
> @@ -1121,6 +1123,25 @@ is limited to type
>  unless
>  .B PTRACE_O_TRACESYSGOOD
>  option is set before the corresponding system call stop has occurred.
> +.TP
> +.BR PTRACE_SET_SYSCALL_INFO " (since Linux 6.16)"
> +.\" commit 26bb32768fe6552de044f782a58b3272073fbfc0
> +Modify information about the system call that caused the stop.
> +The
> +.I data
> +argument is a pointer to
> +.I struct ptrace_syscall_info
> +that specifies the system call information to be set.
> +The
> +.I addr
> +argument should be set to
> +.IR "sizeof(struct ptrace_syscall_info)" .
> +Only the
> +.IR nr ,
> +.IR args ,
> +and
> +.I rval
> +fields can be modified.
>  .\"
>  .SS Death under ptrace
>  When a (possibly multithreaded) process receives a killing signal

Looks good, thanks!


-- 
ldv
