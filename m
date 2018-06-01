From: Michal Hocko <mhocko@kernel.org>
Subject: Re: mlock() confusing 1 half of system RAM limit
Date: Fri, 1 Jun 2018 15:41:54 +0200
Message-ID: <20180601134154.GD15278@dhcp22.suse.cz>
References: <c43ad840-dcab-b86f-bf15-ffb26b66d37b@gblabs.co.uk>
 <20180601114425.GA15686@dhcp22.suse.cz>
 <3e33edd7-89dd-1c09-77df-a2ae23c208f1@gblabs.co.uk>
 <20180601130524.GB15278@dhcp22.suse.cz>
 <1ae5c450-1ffe-cf15-e878-b40f30c0acc3@gblabs.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1ae5c450-1ffe-cf15-e878-b40f30c0acc3@gblabs.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Richman <alex.r@gblabs.co.uk>
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Fri 01-06-18 14:24:23, Alex Richman wrote:
> Ah, that's it.  Increased the limit on the mount and it works fine now.

Well, it is hidden very well. It is not until the page fault time (or
get_user_pages aka __mm_populate) when the operation fails and remasks
ENOSPC -> VM_FAULT_SIGBUS -> EFAULT -> ENOMEM on the way.
-- 
Michal Hocko
SUSE Labs
