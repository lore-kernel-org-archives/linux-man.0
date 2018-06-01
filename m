From: Michal Hocko <mhocko@kernel.org>
Subject: Re: mlock() confusing 1 half of system RAM limit
Date: Fri, 1 Jun 2018 13:44:25 +0200
Message-ID: <20180601114425.GA15686@dhcp22.suse.cz>
References: <c43ad840-dcab-b86f-bf15-ffb26b66d37b@gblabs.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c43ad840-dcab-b86f-bf15-ffb26b66d37b@gblabs.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Richman <alex.r@gblabs.co.uk>
Cc: linux-man@vger.kernel.org, linux-mm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Fri 01-06-18 10:53:57, Alex Richman wrote:
> Hi,
> 
> I'm seeing a 1/2 of system RAM limit when calling mlock().  mlock(2) says:
> > ENOMEM (Linux 2.4 and earlier) the calling process tried to lock more than
> half of RAM.
> Which implies to me that the 1 half of system RAM limit should be only Linux
> 2.4 and earlier, but I'm running linux 4.4.127 and still seeing the limit.
> 
> This is on a system with 66007168 KB total memory, locking 33794621440 bytes
> works, locking 33795653632 bytes does not work.

I assume you are doing mlock on MAP_SHARED resp. on mmap of shmem
file. You are likely to hit the shmem limit. This is half of the
available memory by default.
-- 
Michal Hocko
SUSE Labs
