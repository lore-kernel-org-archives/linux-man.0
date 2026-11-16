Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845453;
	b=dIMyWe6IT6yrFiDF3YeVJcD3nJA0Fhvz6byc2CfXl/lqZ8BVamprd+foKIieO32R++tv
	 TszRURg90ha9mfK4Ju0smyUcqwMJMwFTvoVmldPCZ8G7F8qkfIcaKpR5/UOL1n98ru0tN
	 CGwFkb6xgvR1onJoF7ml9j7frp8qZEHTr+i/YomGRpXsvTkdFKdO4H3Mz5kinpGTwjGKx
	 vkf2I38X4DrEppf1uPNExOvpBRYfTca0At4b+QB2yitNNLsfvxfjzG7dw6kSXc0K8Km5f
	 UDcAMRNQEpK84lFoKyy6hMByfCOp0quD9C2krN0XFmZEF5t8HfUgfCC8fUzWcr0Y0iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845453;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Oadzkl3ORJ3wQkyJMXU/6qO7rxNx4uwgoabiDJ+Xsug=;
	b=zW3gvOR2Ca0GVUaRpU5yzOueBXLdf7kiRCgbBz2hKydjHAVskGV423vSnfmxyCw+1Rgz
	 ssotmOFmASBCtL2N/N7AYvblnvIqgz1CAjEcoPwTPwFAzm2CHgHsv8TctaBrstK982TBC
	 H2fLH+bRL1FRrs8WdEfiZNXvUOq8NR0v2NeMiF1ximbly+iLS+nXQXs74YXOel8sYKmnj
	 BdUTpOsBVWN21XOUjHR4NVQ5LCUw7za8w2d0YG6wzS9efI+r5TElJPKSTspOpkQNrOcrp
	 kiWSeV6/ic0xC1FAaQZNWU4jweS7iCdRjCextfYoyUrzBzPRIrr02nav/mAPCWk/GUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ONwX6dMP;
	arc=none smtp.remote-ip=91.218.175.152
Received: from mta0.migadu.com (out-152.mta0.migadu.com [91.218.175.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AE7606A322
	for <linux-man@vger.kernel.org>; Mon, 16 Nov 2026 16:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03AE7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ONwX6dMP
X-Envelope-To: linux-man@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eCHYxBdwWeLQPnYgT+I0HAdi9TUCI4ucB5iF6HP0g60=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794845450; v=1; x=1795450250;
 b=ONwX6dMPf46nLT1v53fiElgDkjxy9Owao356TieVrST08i8VwXFPRKMbeA2jfCAdv22a0uCo
 HZs3SrUe13JBeeGk6yiGy/d40N5YXu58i2CVaYLnCZT3dUlP+VJgB9vfayu5ArHuQa1HRCNxIJ7
 +wnOkVEEOeLoApKlRanXhfho=
X-Envelope-To: linux-man@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 266450e47dd57905;
	Mon, 16 Nov 2026 16:10:46 +0000
X-Mizu-Trace-ID: 266450e47dd57905
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 08:10:45 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Yingjie Wang <x-professor@outlook.com>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	Manfred Spraul <manfred@colorfullife.com>, Alexey Gladkov <legion@kernel.org>, 
	"Eric W . Biederman" <ebiederm@xmission.com>, Vasily Averin <vasily.averin@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
	Michal Hocko <mhocko@suse.com>, Alejandro Colomar <alx@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, 
	"linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v5 1/3] ipc/sem: account dynamically allocated sops
 arrays to memcg
Message-ID: <avsq7s-CVIFiB8y-@linux.dev>
References: <cover.1793250194.git.x-professor@outlook.com>
 <07d9034ec1fb5b6fd5eed2cf60ef3c84d5149e51.1793250194.git.x-professor@outlook.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07d9034ec1fb5b6fd5eed2cf60ef3c84d5149e51.1793250194.git.x-professor@outlook.com>

On Thu, Oct 29, 2026 at 05:03:25AM +0000, Yingjie Wang wrote:
> Commit 6a4746ba0619 ("ipc: remove memcg accounting for sops objects in
> do_semtimedop()") removed accounting based on the assumption that sops
> arrays would remain small, describing a maximum cost of two pages.
> 
> SEMOPM is a UAPI default that can be changed at build time and through
> the per-namespace sysctl. Commit 50ec499b9a43 ("sysctl: allow change
> system v ipc sysctls inside ipc namespace") made that limit tunable by
> IPC namespace owners without capabilities in the initial user namespace.
> 
> do_semtimedop() keeps up to SEMOPM_FAST operations on the stack. Charge
> every larger, dynamically allocated operation array to the caller's memory
> cgroup. This avoids a second size threshold and prevents a configured
> SEMOPM limit from expanding an unaccounted heap-allocation range.
> 
> In a 4-vCPU KVM guest, with the benchmark pinned to one vCPU in a leaf
> memory cgroup, accounting raised the median time per successful semop()
> call by 2.3% to 3.2% for 65, 500 and 1000 operations, compared with
> unaccounted allocation. An invalid semid, which allocates and copies the
> array before returning EINVAL, rose by 5.6% to 11.9%. The 64-operation
> stack path changed by at most 0.9%, and successful calls in the root
> cgroup by at most 2.3%. Each result used 21 samples from three boots.
> 
> Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>
> Link: https://lore.kernel.org/r/20261016152609.2528805-1-x-professor@outlook.com
> Fixes: 6a4746ba0619 ("ipc: remove memcg accounting for sops objects in do_semtimedop()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yingjie Wang <x-professor@outlook.com>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>

