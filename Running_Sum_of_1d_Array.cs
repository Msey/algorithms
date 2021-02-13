public class Solution 
{
        public int[] RunningSum(int[] nums)
        {
            var sum = 0;            
            
            for (int i = 0; i < nums.Length; i++)
            {                
                sum += nums[i];
                nums[i] = sum;
            }

            return nums;
        }
}
